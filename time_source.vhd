library ieee;
use ieee.std_logic_1164.all;
use work.my_package.all;

entity time_source is
	port(
		to_check_out: in boolean_array;
		times: in time_array;
		time_out: out integer range 0 to 100
	);
end time_source;

architecture arch of time_source is
begin

	process(to_check_out)
	begin
		for i in 7 downto 0 loop
			if to_check_out(i) then
				time_out <= times(i);
				exit;
			end if;
			time_out <= 0;
		end loop;
	end process;
	
end arch;
