library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned .all;

entity led_flash is
	port(sys_clk : in std_logic;
			 led : out std_logic_vector(7 downto 0)
		);
end entity;

architecture rtl of led_flash is
	signal clk: std_logic;
begin
	process(sys_clk)
		variable num: integer range 1 to 24000000;
	begin
		if rising_edge(sys_clk) then
			if num=24000000
				then num :=1; clk<=not clk;
				else num :=num+1;
			end if;
		end if;
	end process;

	process(clk)
		variable n:integer range 0 to 7;
	begin
	
	if rising_edge (clk) then
		if n=7 then n:=0;
			else n:=n+1;
		end if ;
	end if;
	
	case n is
		when 0=>led<="01111111";
		when 1=>led<="10111111";
		when 2=>led<="11011111";
		when 3=>led<="11101111";
		when 4=>led<="11110111";
		when 5=>led<="11111011";
		when 6=>led<="11111101";
		when 7=>led<="11111110";
		when others=>led<="11111111";
	end case;
	end process;
end rtl;


