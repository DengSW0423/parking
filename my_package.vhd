library ieee;
use ieee.std_logic_1164.all;

package my_package is

	-- constant
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
	
	-- components
	component cyclic_counter is
		port(
			clk_1hz: in std_logic;
			disp7, disp6: out std_logic_vector(6 downto 0);
			full: out std_logic --full circle output 1
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
	
end my_package;
