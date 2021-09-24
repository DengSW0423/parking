library ieee;
use ieee.std_logic_1164.all;

entity meter is
	port(
		tim: in integer range 0 to 99; --time
		amount: out integer range 0 to 99
	);
end meter;

architecture arch of meter is

begin
	process(tim)
		variable amount_t: integer range 0 to 99;
		variable time_t: integer range 0 to 99;
	begin
		time_t := tim;
		amount_t := 0;
		while time_t >= 24 loop
			time_t := time_t - 24;
			amount_t := amount_t + 40;
		end loop;
		
		amount_t := amount_t + time_t * 2;
		amount <= amount_t;
	end process;
end arch;
