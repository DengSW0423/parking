library ieee;
use ieee.std_logic_1164.all;
use work.my_package.all;

entity time_counter is
	port(
		clk_1hz: in std_logic;
		led: in std_logic_vector(7 downto 0);
		times: buffer time_array
	);
end time_counter;

architecture arch of time_counter is
begin
	process(clk_1hz)
	begin
		if rising_edge(clk_1hz) then
			for i in 7 downto 0 loop
				if led(i) = '0' then
					if times(i) = 99 then
						times(i) <= 99; --overflow
					else
						times(i) <= times(i) + 1;
					end if;
				end if;
			end loop;
		end if;
	end process;
end arch;
