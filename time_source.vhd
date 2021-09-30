library ieee;
use ieee.std_logic_1164.all;
use work.my_package.all;

entity time_source is
	port(
		index: in integer range 0 to 7;
		times: in time_array;
		time_out: out integer range 0 to 99
	);
end time_source;

architecture arch of time_source is
begin
	time_out <= times(index);
end arch;
