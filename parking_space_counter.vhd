library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity parking_space_counter is
	port(
		parking_spaces: in std_logic_vector(7 downto 0);
		checked_out: in boolean;
		blinking: out boolean;
		spaces: out integer range 0 to 8
	);
end parking_space_counter;

architecture arch of parking_space_counter is

begin
	process(checked_out, parking_spaces)
		variable cur_spaces: integer range 0 to 8;
	begin
		for i in 0 to 7 loop
			if parking_spaces(i) = '0' then
				cur_sapces := cur_spaces + 1;
			end if;
		end loop;
		
		if (cur_spaces > spaces) and (not checked_out) then
			blinking <= true;
		else blinking <= false;
		end if;
		
		spaces <= cur_spaces;
	end process;
end arch;
