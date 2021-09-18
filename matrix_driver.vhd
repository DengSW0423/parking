library ieee;
use ieee.std_logic_1164.all;
use work.my_package.all;

entity matrix_driver is
	port(
		rst: in std_logic;
		clk_2hz:in std_logic;
		clk_100hz: in std_logic;
		blinking: in boolean;
		spaces: in integer range 0 to 8;
		row: out std_logic_vector(7 downto 0);
		col: out std_logic_vector(7 downto 0);
	);
end matrix_driver;

architecture arch of matrix_driver is

begin
	process(clk_2hz, clk_100hz, rst)
		variable index: integer range 0 to 8;
		variable matrix: number_matrix;
	begin
		if rising_edge(rst) then
			row <= "11111110";
			col <= "00000000";
		elsif rising_edge(clk_100hz) then
			if blinking then  -- need blinking in 2hz.
				if clk_2hz = '1' then -- show number matrix when clk_2hz is high.
					row ror 1;
					case sapces is
						when 0 => matrix := _ZERO;
						when 1 => matrix := _ONE;
						when 2 => matrix := _TWO;
						when 3 => matrix := _THREE;
						when 4 => matrix := _FOUR;
						when 5 => matrix := _FIVE;
						when 6 => matrix := _SIX;
						when 7 => matrix := _SEVEN;
						when 8 => matrix := _EIGHT;
						when others => null;
					end case;
					col <= matrix(index);
					index := index + 1;
					if index = 8 then
						index := 0;
					end if;	
				else  -- keep row and matrix's index in sync, but do not show number as clk_2hz is low.
					row ror 1;
					col <= "00000000";
					index := index + 1;
					if index = 8 then
						index := 0;
					end if;
				end if;
			else  -- no need blinking.
				row ror 1;
				case sapces is
					when 0 => matrix := _ZERO;
					when 1 => matrix := _ONE;
					when 2 => matrix := _TWO;
					when 3 => matrix := _THREE;
					when 4 => matrix := _FOUR;
					when 5 => matrix := _FIVE;
					when 6 => matrix := _SIX;
					when 7 => matrix := _SEVEN;
					when 8 => matrix := _EIGHT;
					when others => null;
				end case;
				col <= matrix(index);
				index := index + 1;
				if index = 8 then
					index := 0;
				end if;
			end if;
		end if;
	end process;
end arch;
