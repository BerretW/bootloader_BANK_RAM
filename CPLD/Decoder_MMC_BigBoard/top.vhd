library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is

    port 
    (
			CLK			:	in	std_logic;
			RESET			:	in	std_logic:='1';
			RW				:	in std_logic:='1';
			ADDR   		: 	in unsigned(15 downto 0);
			DATA_BUS		:	INOUT	std_logic_vector(7 downto 0) :="ZZZZZZZZ";
			SRAM_BA		:	BUFFER std_logic_vector(7 downto 0):="00000000";
			ROM_CS		:	OUT std_logic;
			RAM_CS		:	OUT std_logic;
			IO_CS			:	OUT std_logic;
			ACIA_CS		:	OUT std_logic;
			VIA1_CS		:	OUT std_logic;
			VIA2_CS		:	OUT std_logic;
			HRAM_CS		:	OUT std_logic;
			IRQ_CS		:	OUT std_logic;
			MEMR			:	OUT std_logic;
			MEMW			:	OUT std_logic
    );

 
end entity;

architecture behavioral of top is
signal CACHE	:	std_logic_vector(7 downto 0);
signal decoded_address: integer range 16#0000# to 16#FFFF#;
signal banks_cs : std_logic :='1';

begin

decoded_address <= to_integer(ADDR);

SRAM_BA <= CACHE;
MEMR <= NOT RW;
MEMW <= RW;



decode_BA_RD:process (CLK)
begin
if rising_edge(CLK) then
if RESET <= '0' then
	--CACHE <= "00000000";
else 
DATA_BUS <= "ZZZZZZZZ";
	

	
--if falling_edge(CLK) then 
	if banks_cs <= '0' then 
		--if RW = '0' then
		--	CACHE <= DATA_BUS;
		--end if;
		
		if RW = '1' then
			DATA_BUS <= CACHE;
		end if;
	end if;
end if;
end if;

end process;

decode_BA_WR:process (CLK)
begin
--if falling_edge(CLK) then
if RESET <= '0' then
	CACHE <= "00000000";
end if;
	if banks_cs <= '0' then 
		if RW = '0' then
			CACHE <= DATA_BUS;
		end if;
		
	end if;
--end if;


end process;

decode:process(decoded_address)
begin

ROM_CS <= '1';
RAM_CS <= '1';
--IO_CS <= '1';
HRAM_CS <= '1';
			
ACIA_CS <= '1';
VIA1_CS <= '1';
VIA2_CS <= '1';
IRQ_CS <= '1';
banks_cs <= '1';
			
case decoded_address is
	when 16#0000#	=> banks_cs 	<= '0';
	when 16#0001# to 16#7FFF# 	=> RAM_CS 		<= '0';
	when 16#8000# to 16#BFFF# 	=> HRAM_CS 		<= '0';
	--when 16#C300# to 16#CEFF# 	=> IO_CS 		<= '0';
	when 16#CFF0# to 16#CFFF# 	=> ACIA_CS 		<= '0';
	when 16#CF00# to 16#CF0F# 	=> VIA1_CS 		<= '0';
	when 16#CF10# to 16#CF1F# 	=> VIA2_CS 		<= '0';
	when 16#CF20# to 16#CF2F# 	=> IRQ_CS 		<= '0';
	when 16#D000# to 16#FFFF# 	=> ROM_CS 		<= '0';
	when others => null;
end case;
end process;

IO_CS <= NOT(ADDR(15) AND ADDR(14) AND NOT(ADDR(13)) AND NOT(ADDR(12)));



end behavioral;

