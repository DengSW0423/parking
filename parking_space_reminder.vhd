library ieee;
use ieee.std_logic_1164.all;

entity parking_space_reminder is
	port(
		rst: in std_logic;
		switches: in std_logic_vector(7 downto 0);	
		led: out std_logic_vector(7 downto 0)
	);
end parking_space_reminder;

architecture arch of parking_space_reminder is
begin
	process(switches, rst)
		variable led_t: std_logic_vector(7 downto 0) := "00000000";
		variable count: integer range 0 to 1 := 0;
	begin
		if rst = '1' then
			count := 1;
		end if;
		
		if count = 0 then
			led <= "00000000";
		else
			for i in 0 to 7 loop
				led(i) <= not switches(i);
			end loop;
		end if;
	end process;
end arch;
