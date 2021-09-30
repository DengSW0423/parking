library ieee;
use ieee.std_logic_1164.all;
use work.my_package.all;

entity parking is
	port(
		rst: in std_logic; --btn7
		row: out bit_vector(7 downto 0);
		col: out std_logic_vector(7 downto 0);
		clk_1000hz: in std_logic;
		disp_amount: out std_logic_vector(6 downto 0);
		disp_time: out std_logic_vector(6 downto 0);
		disp_cyclic: out std_logic_vector(6 downto 0);
		full: out std_logic;
		disp_switch_76: out std_logic_vector(1 downto 0);
		disp_switch_43: out std_logic_vector(1 downto 0);
		disp_switch_10: out std_logic_vector(1 downto 0);
		unused_disp: out std_logic_vector(5 downto 0);
		unused_led: out std_logic_vector(6 downto 0);
		switches: in std_logic_vector(7 downto 0);
		led: buffer std_logic_vector(7 downto 0)
	);
end parking;

architecture arch of parking is
	signal clk_1hz: std_logic;
	signal clk_2hz: std_logic;
	signal clk_50hz: std_logic;
	signal clk_100hz: std_logic;
	signal checked_out: boolean;
	signal blinking: boolean;
	signal spaces: integer range 0 to 8;
	signal tim: integer range 0 to 99;
	signal times: time_array;
	signal index: integer range 0 to 7; --which time to display
	signal amount: integer range 0 to 99;
begin
	checked_out <= true;
	unused_disp <= "111111";
	unused_led <= "0000000";
	
	u1: cyclic_counter port map(clk_100hz, disp_cyclic, disp_switch_76, full);
	u2: divider_50 port map(clk_100hz, clk_2hz);
	u3: divider_2 port map(clk_2hz, clk_1hz);
	u4: divider_2 port map(clk_100hz, clk_50hz);
	u14: divider_10 port map(clk_1000hz, clk_100hz);
	
	u5: parking_space_counter port map(led, spaces);
	u6: matrix_driver port map(rst, clk_2hz, clk_1000hz, blinking, spaces, row, col);
	
	u7: parking_space_reminder port map(switches, led);
	
	u8: disp_driver port map(clk_100hz, clk_2hz, blinking, tim, disp_time, disp_switch_43);
	u9: disp_driver port map(clk_100hz, clk_2hz, blinking, amount, disp_amount, disp_switch_10);
	
	u10: time_counter port map(clk_1hz, led, times);
	u11: meter port map(tim, amount);
	u12: selector port map(led, index);
	u13: time_source port map(index, times, tim);
end arch;
