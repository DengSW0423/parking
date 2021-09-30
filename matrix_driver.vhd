library ieee;
use ieee.std_logic_1164.all;
use work.my_package.all;

entity matrix_driver is
	port(
		rst: in std_logic;
		clk_2hz:in std_logic;
		clk_1000hz: in std_logic;
		blinking: in boolean;
		spaces: in integer range 0 to 8;
		row: out bit_vector(7 downto 0);
		col: out std_logic_vector(7 downto 0)
	);
end matrix_driver;

architecture arch of matrix_driver is
	signal reset_out: std_logic;
	signal clk_100hz: std_logic;
begin
	u1: debouncer port map(clk_100hz, rst, reset_out);
	u2: divider_10 port map(clk_1000hz, clk_100hz);
	
	process(clk_1000hz)
		variable index: integer range 0 to 7;
		variable matrix: number_matrix;
		variable scan_row: bit_vector(7 downto 0);
	begin
		if rising_edge(clk_1000hz) then
			if reset_out = '1' then
				index := 0;
				scan_row := "01111111";
			end if; --reset
			
			case spaces is
				when 0 => matrix := ZERO_m;
				when 1 => matrix := ONE_m;
				when 2 => matrix := TWO_m;
				when 3 => matrix := THREE_m;
				when 4 => matrix := FOUR_m;
				when 5 => matrix := FIVE_m;
				when 6 => matrix := SIX_m;
				when 7 => matrix := SEVEN_m;
				when 8 => matrix := EIGHT_m;
				when others => null;
			end case;
			
			if blinking and clk_2hz = '1' then
				row <= "11111111";
				col <= "00000000";
			else
				row <= scan_row;
				col <= matrix(index);
			end if;
			
			scan_row := scan_row ror 1;
			if index = 7 then
				index := 0;
			else
				index := index + 1;
			end if;
		end if;
	end process;
end arch;
