library ieee;
use ieee.std_logic_1164.all;
use work.my_package.all;

entity parking is
	port(
		clk_100hz: in std_logic;
		disp7, disp6: out std_logic_vector(6 downto 0);
		full: out std_logic
	);
end parking;

architecture arch of parking is
	signal clk_1hz: std_logic;
	signal clk_2hz: std_logic;
begin
	u1: cyclic_counter port map(clk_1hz, disp7, disp6, full);
	u2: divider_50 port map(clk_100hz, clk_2hz);
	u3: divider_2 port map(clk_2hz, clk_1hz);
end arch;
