library ieee;
use ieee.std_logic_1164.all;

entity parking_space_reminder is
	port(
		clk_1000hz: in std_logic;
		clk_2hz: in std_logic;
		rst: in std_logic;
		switches: in std_logic_vector(7 downto 0);
		led_blinking: in boolean;
		led_index: in integer range 0 to 7;
		led: out std_logic_vector(7 downto 0)
	);
end parking_space_reminder;

architecture arch of parking_space_reminder is
begin
	process(clk_1000hz)
		variable led_t: std_logic_vector(7 downto 0) := "00000000";
	begin
		if rising_edge(clk_1000hz) then
			if rst = '1' then
				if led_t = "00000000" then
					led_t := not switches;
					led <= led_t;
				else
					led_t := "00000000";
					led <= led_t;
				end if;
			else
				if led_t = "00000000" then
					led <= led_t;
				elsif led_blinking then
					led(led_index) <= clk_2hz;
					for i in 7 downto 0 loop
						if i /= led_index then
							led(i) <= not switches(i);
						end if;
					end loop;
				else
					led <= not switches;
				end if;	
			end if;
		end if;
	end process;
end arch;
