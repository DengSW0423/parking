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
	signal disp_blinking: boolean;
	signal matrix_blinking: boolean;
	signal led_blinking: boolean;
	signal spaces: integer range 0 to 8;
	signal times: time_array;
	signal to_disp: boolean_array;
	signal to_check_out: boolean_array;
	signal numbers: integer_array;
	signal check_out_debounced: std_logic;
	signal rst_debounced: std_logic;
	signal stop_blinking: boolean;
	signal led_index: integer range 0 to 7;
begin
	unused_disp <= "11";
	unused_led <= "00000000";
	dot <= '0';
	green_col <= "00000000";
	
	u1: cyclic_counter port map(rst_debounced, clk_1hz, numbers(0));
	u15: debouncer port map(clk_1000hz, check_out, check_out_debounced);
	u16: debouncer port map(clk_1000hz, rst, rst_debounced);
	
	u2: divider_50 port map(clk_100hz, clk_2hz);
	u3: divider_2 port map(clk_2hz, clk_1hz);
	u4: divider_2 port map(clk_100hz, clk_50hz);
	u14: divider_10 port map(clk_1000hz, clk_100hz);
	
	u5: parking_space_counter port map(led_blinking, switches, spaces);
	u6: matrix_driver port map(rst_debounced, clk_2hz, clk_1000hz, matrix_blinking, spaces, row, col);
	
	u7: parking_space_reminder port map(clk_1000hz, clk_2hz, rst_debounced, switches, led_blinking, led_index, led);
	
	u8: disp_driver port map(rst_debounced, clk_1000hz, clk_2hz, disp_blinking, numbers, disp, disp_switch);
	
	u9: checkout_control port map(clk_1000hz ,clk_1hz, check_out_debounced, beep, disp_blinking);
	u10: time_counter port map(rst_debounced, check_out_debounced, clk_1hz, switches, led_index, times);
	u11: meter port map(numbers(1), numbers(2)); --amount
	u13: time_source port map(times, rst_debounced, check_out_debounced, switches, 
								matrix_blinking, led_blinking, led_index, numbers(1)); --time
	
end arch;
