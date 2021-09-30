library ieee;
use ieee.std_logic_1164.all;

entity divider_10 is
	port(
		clk_origin: in std_logic;
		clk_out: out std_logic
	);
end divider_10;

architecture arch of divider_10 is
	signal tmp: std_logic;
begin
	process(clk_origin)
		variable count: integer range 0 to 6;
	begin
		if rising_edge(clk_origin) then
			count := count + 1;
			if count = 5 then
				count := 0;
				tmp <= not tmp;
			end if;
		end if;
	end process;
	clk_out <= tmp;
end arch;
