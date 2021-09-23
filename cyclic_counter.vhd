library ieee;
use ieee.std_logic_1164.all;
use work.my_package.all;

entity cyclic_counter is
	port(
		clk_100hz: in std_logic;
		disp: out std_logic_vector(6 downto 0);
		disp_switch: buffer std_logic_vector(1 downto 0);
		full: out std_logic --full circle output 1
	);
end cyclic_counter;

architecture arch of cyclic_counter is
	signal clk_1hz: std_logic;
	signal clk_2hz: std_logic;
begin	
	t1: divider_50 port map(clk_100hz, clk_2hz);
	t2: divider_2 port map(clk_2hz, clk_1hz);
	process(clk_1hz, clk_100hz)
		variable data: integer range 0 to 24;
		variable disp7, disp6: std_logic_vector(6 downto 0);
		variable disp_state: std_logic_vector(1 downto 0);
	begin
		if rising_edge(clk_1hz) then
			data := data + 1;
			if data = 24 then
				data := 0;
				full <= '1';
			else
				full <= '0';
			end if;
	
			case data is
				when 0 => disp7 := ZERO; disp6 := ZERO;
				when 1 => disp7 := ZERO; disp6 := ONE;
				when 2 => disp7 := ZERO; disp6 := TWO;
				when 3 => disp7 := ZERO; disp6 := THREE;
				when 4 => disp7 := ZERO; disp6 := FOUR;
				when 5 => disp7 := ZERO; disp6 := FIVE;
				when 6 => disp7 := ZERO; disp6 := SIX;
				when 7 => disp7 := ZERO; disp6 := SEVEN;
				when 8 => disp7 := ZERO; disp6 := EIGHT;
				when 9 => disp7 := ZERO; disp6 := NINE;
				when 10 => disp7 := ONE; disp6 := ZERO;
				when 11 => disp7 := ONE; disp6 := ONE;
				when 12 => disp7 := ONE; disp6 := TWO;
				when 13 => disp7 := ONE; disp6 := THREE;
				when 14 => disp7 := ONE; disp6 := FOUR;
				when 15 => disp7 := ONE; disp6 := FIVE;
				when 16 => disp7 := ONE; disp6 := SIX;
				when 17 => disp7 := ONE; disp6 := SEVEN;
				when 18 => disp7 := ONE; disp6 := EIGHT;
				when 19 => disp7 := ONE; disp6 := NINE;
				when 20 => disp7 := TWO; disp6 := ZERO;
				when 21 => disp7 := TWO; disp6 := ONE;
				when 22 => disp7 := TWO; disp6 := TWO;
				when 23 => disp7 := TWO; disp6 := THREE;
				when others => null;
			end case;
		end if;
		
		if rising_edge(clk_100hz) then
			if disp_state = "01" then
				disp_switch <= "10";
				disp <= disp6;
				disp_state := "10";
			elsif disp_state = "10" then
				disp_switch <= "01";
				disp <= disp7;
				disp_state := "01";
			else
				disp_state := "01";
			end if;
		end if;
		
	end process;
end arch;
