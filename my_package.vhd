library ieee;
use ieee.std_logic_1164.all;

package my_package is

-- 1.type
	type number_matrix is array (0 to 7) of std_logic_vector(7 downto 0);
	type time_array is array(0 to 7) of integer range 0 to 100;
	type integer_array is array(0 to 2) of integer range 0 to 99;
	type boolean_array is array(0 to 7) of boolean;

-- 2.constant
	--segment led
	constant ZERO: std_logic_vector(6 downto 0) := "1111110";
	constant ONE: std_logic_vector(6 downto 0) := "0110000";
	constant TWO: std_logic_vector(6 downto 0) := "1101101";
	constant THREE: std_logic_vector(6 downto 0) := "1111001";
	constant FOUR: std_logic_vector(6 downto 0) := "0110011";
	constant FIVE: std_logic_vector(6 downto 0) := "1011011";
	constant SIX: std_logic_vector(6 downto 0) := "1011111";
	constant SEVEN: std_logic_vector(6 downto 0) := "1110000";
	constant EIGHT: std_logic_vector(6 downto 0) := "1111111";
	constant NINE: std_logic_vector(6 downto 0) := "1111011";
	
	--8*8 matrix
	constant ZERO_m: number_matrix := (
		"00011000",
		"00111100",
		"00100100",
		"00100100",
		"00100100",
		"00100100",
		"00111100",
		"00011000"
	);
	
	constant ONE_m: number_matrix := (
		"00011000",
		"00111000",
		"00011000",
		"00011000",
		"00011000",
		"00011000",
		"00011000",
		"00011000"
	);
	
	constant TWO_m: number_matrix := (
		"00011100",
		"00111110",
		"00100110",
		"00000110",
		"00001100",
		"00011100",
		"00111000",
		"00111110"
	);
	
	constant THREE_m: number_matrix := (
		"00011100",
		"00110110",
		"00000110",
		"00111100",
		"00111110",
		"00000110",
		"00001110",
		"00111100"
	);
	
	constant FOUR_m: number_matrix := (
		"00000100",
		"00001100",
		"00011100",
		"00100100",
		"01100100",
		"01111111",
		"00000100",
		"00000100"
	);
	
	constant FIVE_m: number_matrix := (
		"00110000",
		"00111110",
		"00110000",
		"00111100",
		"00000110",
		"00000110",
		"00100110",
		"00011100"
	);	

	constant SIX_m: number_matrix := (
		"00011100",
		"00110010",
		"00100000",
		"00111100",
		"00110110",
		"00100010",
		"00100110",
		"00011100"
	);
	
	constant SEVEN_m: number_matrix := (
		"00111100",
		"01111110",
		"00000110",
		"00001100",
		"00011000",
		"00011000",
		"00011000",
		"00011000"
	);
	
	constant EIGHT_m: number_matrix := (
		"00111100",
		"01100110",
		"01100110",
		"01111110",
		"00111100",
		"01100110",
		"01100110",
		"00111100"
	);
	
-- 3.components
	component cyclic_counter is
		port(
			rst: in std_logic;
			clk_1hz: in std_logic;
			number: out integer range 0 to 23
		);
	end component;
	
	component divider_50 is
		port(
			clk_origin: in std_logic;
			clk_out: out std_logic
		);
	end component;
	
	component divider_2 is
		port(
			clk_origin: in std_logic;
			clk_out: out std_logic
		);
	end component;
	
	component divider_10 is
		port(
			clk_origin: in std_logic;
			clk_out: out std_logic
		);
	end component;
	
	component parking_space_counter is
		port(
			parking_spaces: in std_logic_vector(7 downto 0);
			spaces: out integer range 0 to 8
		);
	end component;
	
	component matrix_driver is
		port(
			rst: in std_logic;
			clk_2hz:in std_logic;
			clk_1000hz: in std_logic;
			blinking: in boolean;
			spaces: in integer range 0 to 8;
			row: buffer bit_vector(7 downto 0);
			col: out std_logic_vector(7 downto 0)
		);
	end component;
	
	component time_counter is
		port(
			clk_1hz: in std_logic;
			led: in std_logic_vector(7 downto 0);
			times: out time_array
		);
	end component;
	
	component parking_space_reminder is
		port(
			switches: in std_logic_vector(7 downto 0);	
			led: out std_logic_vector(7 downto 0)
		);
	end component;
	
	component checkout_control is
		port(
			clk_100hz: in std_logic;
			clk_1hz: in std_logic;
			check_out: in std_logic; --btn0
			beep: out std_logic;
			blinking: out boolean;
			checked_out: buffer boolean
		);
	end component;
	
	component debouncer is
		port(
			clk_100hz: in std_logic;
			btn_in: in std_logic;
			btn_out: out std_logic
		);
	end component;
	
	component disp_driver is
		port(
			clk_1000hz: in std_logic;
			clk_2hz: in std_logic;
			blinking: in boolean;
			numbers: in integer_array;
			disp: out std_logic_vector(6 downto 0);
			disp_switch: buffer bit_vector(5 downto 0)
		);
	end component;
	
	component meter is
		port(
			tim: in integer range 0 to 99; --time
			amount: out integer range 0 to 99
		);
	end component;
	
	component selector is
		port (
			check_out: in std_logic;
			led: in std_logic_vector(7 downto 0);
			to_check_out: out boolean_array
		);
	end component;
	
	component time_source is
		port(
			to_check_out: in boolean_array;
			times: in time_array;
			time_out: out integer range 0 to 100
		);
	end component;
	
	component stop_blinkinger is
		port(
			clk_1hz: in std_logic;
			blinking: in boolean;
			stop_blinking: out boolean
		);
	end component;
	
end my_package;
