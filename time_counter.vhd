library ieee;
use ieee.std_logic_1164.all;
use work.my_package.all;

entity time_counter is
	port(
		clk_1hz: in std_logic;
		led: in std_logic_vector(7 downto 0);
		times_out: out time_array
	);
end time_counter;

architecture arch of time_counter is
	signal times: time_array;
begin
	process(clk_1hz)
	begin
		if rising_edge(clk_1hz) then
			for i in 0 to 7 loop
				if led(i) = '0' then
					times(i) <= times(i) + 1;
				end if;
			end loop;
		end if;
	end process;
	
	process(led)
	begin
		for i in 0 to 7 loop
			if rising_edge(led(i)) then
				times_out(i) <= times(i);
			end if;
		end loop;
	end process;
end arch;
