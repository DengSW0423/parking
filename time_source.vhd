library ieee;
use ieee.std_logic_1164.all;
use work.my_package.all;

entity time_source is
	port(
		check_out: in boolean;
		indexs: in index_array;
		times: in time_array;
		time_out: out integer range 0 to 99
	);
end time_source;

architecture arch of time_source is
begin
	process(check_out)
	begin
		
	
	end process;
end arch;
