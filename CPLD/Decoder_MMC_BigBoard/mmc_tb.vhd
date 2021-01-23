--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:24:47 01/15/2021
-- Design Name:   
-- Module Name:   D:/ISE/Decoder_MMC_BigBoard/mmc_tb.vhd
-- Project Name:  Decoder_MMC_BigBoard
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top
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
 use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY mmc_tb IS
END mmc_tb;
 
ARCHITECTURE behavior OF mmc_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top
    PORT(
         CLK : IN  std_logic;
         RESET : IN  std_logic;
         RW : IN  std_logic;
         ADDR : in unsigned(15 downto 0);
         DATA_BUS : INOUT  std_logic_vector(7 downto 0);
         SRAM_BA : BUFFER std_logic_vector(7 downto 0);
         ROM_CS : OUT  std_logic;
         RAM_CS : OUT  std_logic;
         IO_CS : OUT  std_logic;
         ACIA_CS : OUT  std_logic;
         VIA1_CS : OUT  std_logic;
         VIA2_CS : OUT  std_logic;
         HRAM_CS : OUT  std_logic;
         IRQ_CS : OUT  std_logic;
         MEMR : OUT  std_logic;
         MEMW : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RESET : std_logic := '0';
   signal RW : std_logic := '0';
   signal ADDR : unsigned(15 downto 0) := (others => '0');

	--BiDirs
   signal DATA_BUS : std_logic_vector(7 downto 0);

 	--Outputs
   signal SRAM_BA : std_logic_vector(7 downto 0);
   signal ROM_CS : std_logic;
   signal RAM_CS : std_logic;
   signal IO_CS : std_logic;
   signal ACIA_CS : std_logic;
   signal VIA1_CS : std_logic;
   signal VIA2_CS : std_logic;
   signal HRAM_CS : std_logic;
   signal IRQ_CS : std_logic;
   signal MEMR : std_logic;
   signal MEMW : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 250 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top PORT MAP (
          CLK => CLK,
          RESET => RESET,
          RW => RW,
          ADDR => ADDR,
          DATA_BUS => DATA_BUS,
          SRAM_BA => SRAM_BA,
          ROM_CS => ROM_CS,
          RAM_CS => RAM_CS,
          IO_CS => IO_CS,
          ACIA_CS => ACIA_CS,
          VIA1_CS => VIA1_CS,
          VIA2_CS => VIA2_CS,
          HRAM_CS => HRAM_CS,
          IRQ_CS => IRQ_CS,
          MEMR => MEMR,
          MEMW => MEMW
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin	
		ADDR <= "1111111111111111";	
      RW <= '1';
      wait for 10 ns;	
		RESET <= '1';
		wait for CLK_period;	
		ADDR <= "0000000000000000";
		RW <= '0';
		wait for 200ns;
		DATA_BUS <= "10101010";
		wait for 100ns;
		ADDR <= "1000000000000000";
		RW <= '1';
		DATA_BUS<="ZZZZZZZZ";
		
		wait for CLK_period;
		ADDR <= "0000000000000000";
		RW <= '1';
		wait for 200ns;
		wait for 100ns;
		ADDR <= "1000000000000000";
		RW <= '1';
		wait for CLK_period;
		ADDR <= "1111111111111111";
		wait for CLK_period;	
		wait for CLK_period;	
		wait for CLK_period;	
		ADDR <= "0000000000000001";
		wait for CLK_period;	
		ADDR <= "0111111111111111";
		wait for CLK_period;	
		ADDR <= "1000000000000000";
		wait for CLK_period;	
		ADDR <= "1011111111111111";
		wait for CLK_period;	
		ADDR <= "1100000000000000";
		wait for CLK_period;	
		ADDR <= "1100111111101111";
		wait for CLK_period;	
		ADDR <= "1101000000000000";
		wait for CLK_period;	
		ADDR <= "1111111111111111";
      wait;
		
   end process;

END;
