library ieee;
use ieee.std_logic_1164.all;

entity parking_space_reminder is
	port(
		switches: in std_logic_vector(7 downto 0);	
		led: out std_logic_vector(7 downto 0)
	);
end parking_space_reminder;

architecture arch of parking_space_reminder is

begin
	process(switches)
	begin
		for i in 0 to 7 loop
			led(i) <= not switches(i);
		end loop;
	end process;
end arch;
