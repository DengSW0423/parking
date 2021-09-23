library ieee;
use ieee.std_logic_1164.all;
use work.my_package.all;

entity parking is
	port(
		rst: in std_logic;
		row: out std_logic_vector(7 downto 0);
		col: out std_logic_vector(7 downto 0);
		clk_100hz: in std_logic;
		disp: out std_logic_vector(6 downto 0);
		full: out std_logic;
		disp_switch: out std_logic_vector(1 downto 0);
		unused_disp: out std_logic_vector(5 downto 0);
		led: out std_logic_vector(7 downto 0)
	);
end parking;

architecture arch of parking is
	signal clk_1hz: std_logic;
	signal clk_2hz: std_logic;
	signal clk_50hz: std_logic;
	signal checked_out: boolean;
	signal blinking: boolean;
	signal spaces: integer range 0 to 8;
begin
	checked_out <= true;
	unused_disp <= "111111"; 	
	
	u1: cyclic_counter port map(clk_100hz, disp, disp_switch, full);
	u2: divider_50 port map(clk_100hz, clk_2hz);
	u3: divider_2 port map(clk_2hz, clk_1hz);
	u4: divider_2 port map(clk_100hz, clk_50hz);
	
	u5: parking_space_counter port map(led, checked_out, blinking, spaces);
	u6 matrix_driver port map(rst, clk_2hz, clk_100hz, blinking, spaces, row, col);
end arch;
