library ieee;
use ieee.std_logic_1164.all;
use work.my_package.all;

entity parking is
	port(
		rst: in std_logic; --btn7
		check_out: in std_logic; --btn0
		row: out bit_vector(7 downto 0);
		col: out std_logic_vector(7 downto 0);
		clk_1000hz: in std_logic;
		disp: out std_logic_vector(6 downto 0);
		disp_switch: buffer bit_vector(5 downto 0);
		unused_disp: out std_logic_vector(1 downto 0);
		unused_led: out std_logic_vector(7 downto 0);
		dot: out std_logic;
		green_col: out std_logic_vector(7 downto 0);
		switches: in std_logic_vector(7 downto 0);
		beep: out std_logic;
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
	signal times: time_array;
	signal to_disp: boolean_array;
	signal to_check_out: boolean_array;
	signal numbers: integer_array;
begin
	unused_disp <= "11";
	unused_led <= "00000000";
	dot <= '0';
	green_col <= "00000000";
	blinking <= false;
	
	u1: cyclic_counter port map(rst, clk_1hz, numbers(0));
	
	u2: divider_50 port map(clk_100hz, clk_2hz);
	u3: divider_2 port map(clk_2hz, clk_1hz);
	u4: divider_2 port map(clk_100hz, clk_50hz);
	u14: divider_10 port map(clk_1000hz, clk_100hz);
	
	u5: parking_space_counter port map(led, spaces);
	u6: matrix_driver port map(rst, clk_2hz, clk_1000hz, blinking, spaces, row, col);
	
	u7: parking_space_reminder port map(switches, led);
	
	u8: disp_driver port map(clk_1000hz, clk_2hz, blinking, numbers, disp, disp_switch);
	
	u10: time_counter port map(clk_1hz, led, times);
	u11: meter port map(numbers(1), numbers(2)); --amount
	u12: selector port map(led, to_check_out);
	u15: checkout_control port map(clk_100hz, check_out, beep, to_check_out, to_disp, checked_out);
	u13: time_source port map(to_disp, times, numbers(1)); --time
	
end arch;
