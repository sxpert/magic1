--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:30:15 02/03/2016
-- Design Name:   
-- Module Name:   /home/sxpert/fpga/homebrew_cpu/MicrocodeControl_tb.vhd
-- Project Name:  homebrew_cpu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MicrocodeControl
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY MicrocodeControl_tb IS
END MicrocodeControl_tb;
 
ARCHITECTURE behavior OF MicrocodeControl_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MicrocodeControl
    PORT(
         I_nRESET : IN  std_logic;
         I_CLKM : IN  std_logic;
			O_LATCH : OUT std_logic_vector(3 downto 0);
         O_NEXT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal I_nRESET : std_logic := '0';
   signal I_CLKM : std_logic := '0';

 	--Outputs
	signal O_LATCH : std_logic_vector(3 downto 0);
   signal O_NEXT : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant I_CLKM_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MicrocodeControl PORT MAP (
          I_nRESET => I_nRESET,
          I_CLKM => I_CLKM,
			 O_LATCH => O_LATCH,
          O_NEXT => O_NEXT
        );

   -- Clock process definitions
   I_CLKM_process :process
   begin
		I_CLKM <= '0';
		wait for I_CLKM_period/2;
		I_CLKM <= '1';
		wait for I_CLKM_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		I_nRESET <= '0';
      wait for 100 ns;	
		I_nRESET <= '1';
      wait for I_CLKM_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
