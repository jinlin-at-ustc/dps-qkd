----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:59:03 11/01/2014 
-- Design Name: 
-- Module Name:    serial_unit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity serial_unit is
port(
	sys_clk_500M 	: in std_logic;
	sys_clk_250M 	: in std_logic;

	sys_rst_h 		: in std_logic;
	parallel  		: IN std_logic_vector(3 downto 0);
	
	serial_out   	: OUT std_logic
);
end serial_unit;

architecture Behavioral of serial_unit is

begin

	--OSERDESE1: Output SERial/DESerializer
   --            Virtex-6
   -- Xilinx HDL Language Template, version 12.3

   OSERDESE1_inst : OSERDESE1
   generic map (
      DATA_RATE_OQ => "DDR",       -- "SDR" or "DDR" 
      DATA_RATE_TQ => "DDR",       -- "BUF", "SDR" or "DDR" 
      DATA_WIDTH => 4,             -- Parallel data width (1-8,10)
      DDR3_DATA => 1,              -- Must leave at 1 (MIG-only parameter)
      INIT_OQ => '0',              -- Initial value of OQ output (0/1)
      INIT_TQ => '0',              -- Initial value of TQ output (0/1)
      INTERFACE_TYPE => "DEFAULT", -- Must leave at "DEFAULT" (MIG-only parameter)
      ODELAY_USED => 0,            -- Must leave at 0 (MIG-only parameter)
      SERDES_MODE => "MASTER",     -- "MASTER" or "SLAVE" 
      SRVAL_OQ => '0',             -- OQ output value when SR is used (0/1)
      SRVAL_TQ => '0',             -- TQ output value when SR is used (0/1)
      TRISTATE_WIDTH => 1          -- Parallel to serial 3-state converter width (1 or 4)
   )
   port map (
      -- MIG-only Signals: 1-bit (each) Do not use unless generated by MIG
      OCBEXTEND => open,       -- 1-bit Leave unconnected (MIG-only connected signal)
      -- Outputs: 1-bit (each) Serial output ports
      OFB => open,                   -- 1-bit Data feedback output to ISERDESE1
      OQ => serial_out,                     -- 1-bit Data output (connect to I/O port)
      TFB => open,                   -- 1-bit 3-state control output
      TQ => open,                     -- 1-bit 3-state path output
      -- SHIFTOUT1-SHIFTOUT2: 1-bit (each) Data width expansion output ports
      SHIFTOUT1 => open,       -- 1-bit Connect to SHIFTIN1 of slave or unconnected
      SHIFTOUT2 => open,       -- 1-bit Connect to SHIFTIN2 of slave or unconnected
      -- Clocks: 1-bit (each) OSERDESE1 clock input ports
      CLK => sys_clk_500M,                   -- 1-bit High-speed clock input --500MHz
      CLKDIV => sys_clk_250M,             -- 1-bit Divided clock input --83.5MHz
      -- Control Signals: 1-bit (each) Clock enable and reset input ports
      OCE => '1',                   -- 1-bit Active high clock data path enable input
      RST => sys_rst_h,                   -- 1-bit Active high reset input
      TCE => '1',                   -- 1-bit Active high clock enable input for 3-state
      -- D1 - D6: 1-bit (each) Parallel data inputs
      D1 => parallel(0),
      D2 => parallel(1),
      D3 => parallel(2),
      D4 => parallel(3),
      D5 => '0',
      D6 => '0',--first out bit
      -- MIG-only Signals: 1-bit (each) Do not use unless generated by MIG
      CLKPERF => '0',           -- 1-bit Ground input (MIG-only connected signal)
      CLKPERFDELAY => '0', -- 1-bit Ground input (MIG-only connected signal)
      ODV => '0',                   -- 1-bit Ground input (MIG-only connected signal)
      WC => '0',                     -- 1-bit Ground input (MIG-only connected signal)
      -- SHIFTIN1-SHIFTIN2: 1-bit (each) Data width expansion input ports
      SHIFTIN1 => '0',         -- 1-bit Connect to SHIFTOUT1 of master or GND
      SHIFTIN2 => '0',         -- 1-bit Connect to SHIFTOUT2 of master or GND
      -- T1 - T4: 1-bit (each) Parallel 3-state inputs
      T1 => '0',
      T2 => '0',
      T3 => '0',
      T4 => '0' 
   );
	
end Behavioral;

