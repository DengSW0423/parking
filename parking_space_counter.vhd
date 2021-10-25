library ieee;
use ieee.std_logic_1164.all;

entity parking_space_counter is
	port(
		led_blinking: in boolean;
		parking_spaces: in std_logic_vector(7 downto 0); --switches
		spaces: buffer integer range 0 to 8
	);
end parking_space_counter;

architecture arch of parking_space_counter is

begin
	process(parking_spaces, led_blinking)
		variable cur_spaces: integer range 0 to 8;
	begin
		cur_spaces := 0;
		for i in 0 to 7 loop
			if parking_spaces(i) = '0' then
				cur_spaces := cur_spaces + 1;
			end if;
		end loop;
		
		if led_blinking then
			spaces <= cur_spaces - 1;
		else
			spaces <= cur_spaces;
		end if;
	end process;
end arch;
