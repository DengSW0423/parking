library ieee;
use ieee.std_logic_1164.all;

entity parking_space_reminder is
	port(
		clk_1000hz: in std_logic;
		rst: in std_logic;
		switches: in std_logic_vector(7 downto 0);
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
				else
					led <= not switches;
				end if;	
			end if;
		end if;
	end process;
end arch;
