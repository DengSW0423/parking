library ieee;
use ieee.std_logic_1164.all;
use work.my_package.all;

entity disp_driver is
	port(
		clk_100hz: in std_logic;
		clk_2hz: in std_logic;
		blinking: in boolean;
		number: in integer range 0 to 99;
		disp: out std_logic_vector(6 downto 0);
		disp_switch: buffer std_logic_vector(1 downto 0)
	);
end disp_driver;

architecture arch of disp_driver is
	signal disp_left, disp_right: std_logic_vector(6 downto 0); 
begin
	process(clk_100hz)
		variable disp_state: std_logic_vector(1 downto 0);
	begin
		if rising_edge(clk_100hz) then
			if blinking and clk_2hz = '1' then
				disp_switch <= "11";
			else
				if disp_state = "01" then
					disp_switch <= "10";
					disp <= disp_right;
					disp_state := "10";
				elsif disp_state = "10" then
					disp_switch <= "01";
					disp <= disp_left;
					disp_state := "01";
				else
					disp_state := "01";
				end if;
			end if;
		end if;
	end process;
	
	process(number)
	begin
		case number is
			when 0 => disp_left <= ZERO; disp_right <= ZERO;
			when 1 => disp_left <= ZERO; disp_right <= ONE;
			when 2 => disp_left <= ZERO; disp_right <= TWO;
			when 3 => disp_left <= ZERO; disp_right <= THREE;
			when 4 => disp_left <= ZERO; disp_right <= FOUR;
			when 5 => disp_left <= ZERO; disp_right <= FIVE;
			when 6 => disp_left <= ZERO; disp_right <= SIX;
			when 7 => disp_left <= ZERO; disp_right <= SEVEN;
			when 8 => disp_left <= ZERO; disp_right <= EIGHT;
			when 9 => disp_left <= ZERO; disp_right <= NINE;
			when 10 => disp_left <= ONE; disp_right <= ZERO;
			when 11 => disp_left <= ONE; disp_right <= ONE;
			when 12 => disp_left <= ONE; disp_right <= TWO;
			when 13 => disp_left <= ONE; disp_right <= THREE;
			when 14 => disp_left <= ONE; disp_right <= FOUR;
			when 15 => disp_left <= ONE; disp_right <= FIVE;
			when 16 => disp_left <= ONE; disp_right <= SIX;
			when 17 => disp_left <= ONE; disp_right <= SEVEN;
			when 18 => disp_left <= ONE; disp_right <= EIGHT;
			when 19 => disp_left <= ONE; disp_right <= NINE;
			when 20 => disp_left <= TWO; disp_right <= ZERO;
			when 21 => disp_left <= TWO; disp_right <= ONE;
			when 22 => disp_left <= TWO; disp_right <= TWO;
			when 23 => disp_left <= TWO; disp_right <= THREE;
			when 24 => disp_left <= TWO; disp_right <= FOUR;
			when 25 => disp_left <= TWO; disp_right <= FIVE;
			when 26 => disp_left <= TWO; disp_right <= SIX;
			when 27 => disp_left <= TWO; disp_right <= SEVEN;
			when 28 => disp_left <= TWO; disp_right <= EIGHT;
			when 29 => disp_left <= TWO; disp_right <= NINE;
			when 30 => disp_left <= THREE; disp_right <= ZERO;
			when 31 => disp_left <= THREE; disp_right <= ONE;
			when 32 => disp_left <= THREE; disp_right <= TWO;
			when 33 => disp_left <= THREE; disp_right <= THREE;
			when 34 => disp_left <= THREE; disp_right <= FOUR;
			when 35 => disp_left <= THREE; disp_right <= FIVE;
			when 36 => disp_left <= THREE; disp_right <= SIX;
			when 37 => disp_left <= THREE; disp_right <= SEVEN;
			when 38 => disp_left <= THREE; disp_right <= EIGHT;
			when 39 => disp_left <= THREE; disp_right <= NINE;
			when 40 => disp_left <= FOUR; disp_right <= ZERO;
			when 41 => disp_left <= FOUR; disp_right <= ONE;
			when 42 => disp_left <= FOUR; disp_right <= TWO;
			when 43 => disp_left <= FOUR; disp_right <= THREE;
			when 44 => disp_left <= FOUR; disp_right <= FOUR;
			when 45 => disp_left <= FOUR; disp_right <= FIVE;
			when 46 => disp_left <= FOUR; disp_right <= SIX;
			when 47 => disp_left <= FOUR; disp_right <= SEVEN;
			when 48 => disp_left <= FOUR; disp_right <= EIGHT;
			when 49 => disp_left <= FOUR; disp_right <= NINE;
			when 50 => disp_left <= FIVE; disp_right <= ZERO;
			when 51 => disp_left <= FIVE; disp_right <= ONE;
			when 52 => disp_left <= FIVE; disp_right <= TWO;
			when 53 => disp_left <= FIVE; disp_right <= THREE;
			when 54 => disp_left <= FIVE; disp_right <= FOUR;
			when 55 => disp_left <= FIVE; disp_right <= FIVE;
			when 56 => disp_left <= FIVE; disp_right <= SIX;
			when 57 => disp_left <= FIVE; disp_right <= SEVEN;
			when 58 => disp_left <= FIVE; disp_right <= EIGHT;
			when 59 => disp_left <= FIVE; disp_right <= NINE;
			when 60 => disp_left <= SIX; disp_right <= ZERO;
			when 61 => disp_left <= SIX; disp_right <= ONE;
			when 62 => disp_left <= SIX; disp_right <= TWO;
			when 63 => disp_left <= SIX; disp_right <= THREE;
			when 64 => disp_left <= SIX; disp_right <= FOUR;
			when 65 => disp_left <= SIX; disp_right <= FIVE;
			when 66 => disp_left <= SIX; disp_right <= SIX;
			when 67 => disp_left <= SIX; disp_right <= SEVEN;
			when 68 => disp_left <= SIX; disp_right <= EIGHT;
			when 69 => disp_left <= SIX; disp_right <= NINE;
			when 70 => disp_left <= SEVEN; disp_right <= ZERO;
			when 71 => disp_left <= SEVEN; disp_right <= ONE;
			when 72 => disp_left <= SEVEN; disp_right <= TWO;
			when 73 => disp_left <= SEVEN; disp_right <= THREE;
			when 74 => disp_left <= SEVEN; disp_right <= FOUR;
			when 75 => disp_left <= SEVEN; disp_right <= FIVE;
			when 76 => disp_left <= SEVEN; disp_right <= SIX;
			when 77 => disp_left <= SEVEN; disp_right <= SEVEN;
			when 78 => disp_left <= SEVEN; disp_right <= EIGHT;
			when 79 => disp_left <= SEVEN; disp_right <= NINE;
			when 80 => disp_left <= EIGHT; disp_right <= ZERO;
			when 81 => disp_left <= EIGHT; disp_right <= ONE;
			when 82 => disp_left <= EIGHT; disp_right <= TWO;
			when 83 => disp_left <= EIGHT; disp_right <= THREE;
			when 84 => disp_left <= EIGHT; disp_right <= FOUR;
			when 85 => disp_left <= EIGHT; disp_right <= FIVE;
			when 86 => disp_left <= EIGHT; disp_right <= SIX;
			when 87 => disp_left <= EIGHT; disp_right <= SEVEN;
			when 88 => disp_left <= EIGHT; disp_right <= EIGHT;
			when 89 => disp_left <= EIGHT; disp_right <= NINE;
			when 90 => disp_left <= NINE; disp_right <= ZERO;
			when 91 => disp_left <= NINE; disp_right <= ONE;
			when 92 => disp_left <= NINE; disp_right <= TWO;
			when 93 => disp_left <= NINE; disp_right <= THREE;
			when 94 => disp_left <= NINE; disp_right <= FOUR;
			when 95 => disp_left <= NINE; disp_right <= FIVE;
			when 96 => disp_left <= NINE; disp_right <= SIX;
			when 97 => disp_left <= NINE; disp_right <= SEVEN;
			when 98 => disp_left <= NINE; disp_right <= EIGHT;
			when 99 => disp_left <= NINE; disp_right <= NINE;
			when others => null;
		end case;
	end process;
end arch;
