library ieee;
use ieee.std_logic_1164.all;

entity divider_2 is
	port(
		clk_origin: in std_logic;
		clk_out: out std_logic
	);
end divider_2;

architecture arch of divider_2 is
	signal tmp: std_logic;
begin
	process(clk_origin)
	begin
		if rising_edge(clk_origin) then
			tmp <= not tmp;
		end if;
	end process;
	clk_out <= tmp;
end arch;
