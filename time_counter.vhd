library ieee;
use ieee.std_logic_1164.all;

entity time_counter is
	port(
		clk_1hz: in std_logic;
		led: in std_logic_vector(7 downto 0);
		tim: out integer range 0 to 100
	);
end time_counter;

architecture arch of time_counter is
	type time_array is array(0 to 7) of integer range 0 to 100;
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
		for i in range 0 to 7 loop
			if rising_edge(led(i)) then
				tim <= times(i);
				exit;
			end if;
		end loop;
	end process;
end arch;
