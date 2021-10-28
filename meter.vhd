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
		if tim <= 2 then
			time_t := 0;
		else
			time_t := tim - 2;
		end if;
		amount_t := 0;
		while time_t >= 24 loop
			time_t := time_t - 24;
			if amount_t + 40 > 99 then
				amount_t := 99;
				exit;
			else
				amount_t := amount_t + 40;
			end if;
		end loop;
		
		amount_t := amount_t + time_t * 2;
		amount <= amount_t;
	end process;
end arch;
