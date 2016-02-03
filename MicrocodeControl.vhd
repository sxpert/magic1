----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:57:48 02/02/2016 
-- Design Name: 
-- Module Name:    MicrocodeControl - Behavioral 
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
USE ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MicrocodeControl is
Port ( I_nRESET : in STD_LOGIC;
       I_CLKM   : in STD_LOGIC;
		 O_LATCH  : out STD_LOGIC_VECTOR (3 downto 0);
		 O_NEXT   : out STD_LOGIC_VECTOR (7 downto 0)
	  );
end MicrocodeControl;

architecture Behavioral of MicrocodeControl is
	type t_ucs_latch is array (0 to 15) of STD_LOGIC_VECTOR (3 downto 0);
	type t_ucs_next is array (0 to 15) of STD_LOGIC_VECTOR (7 downto 0);
   -- represents the microcode storage
	signal ucs_latch : t_ucs_latch := (
	   "0001", "0100", "0010", "0110", "0011", "0000", "0111", "0101", others => "1000");
	signal ucs_next: t_ucs_next := (
		"00000001","00000010","00000011","00000101",
		"00000101","00000110","00000111","00000000",
		others => "00000000");
	-- microcode latch
	signal l_LATCH: STD_LOGIC_VECTOR (3 downto 0) := "0000";
	signal l_NEXT: STD_LOGIC_VECTOR (7 downto 0) := "00000000";
begin
  process (I_CLKM, I_nRESET, l_LATCH, l_NEXT) is
  begin
    if I_nRESET='0' then
		-- reset is asserted. everything is 0
		l_LATCH <= "0000";
		l_NEXT <= "00000000";
	 else
	   if rising_edge (I_CLKM) then
			-- generate the next value in a variable
			
			-- reset is 1, normal functionning
			l_LATCH <= ucs_latch(to_integer(unsigned(l_NEXT(4 downto 0))));
			l_NEXT <= ucs_next(to_integer(unsigned(l_NEXT(4 downto 0))));
		end if;
	 end if;
	 O_LATCH <= l_LATCH;
	 O_NEXT <= l_NEXT;
  end process;
end Behavioral;

