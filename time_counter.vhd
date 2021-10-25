library ieee;
use ieee.std_logic_1164.all;
use work.my_package.all;

entity time_counter is
	port(
		rst: in std_logic;
		check_out: in std_logic;
		clk_1hz: in std_logic;
		switches: in std_logic_vector(7 downto 0);
		times: buffer time_array
	);
end time_counter;

architecture arch of time_counter is
begin
	process(clk_1hz, check_out, rst)
	begin
		if check_out = '1' or rst = '1' then
			times <= (0, 0, 0, 0, 0, 0, 0, 0);
		elsif rising_edge(clk_1hz) then
			for i in 7 downto 0 loop
				if switches(i) = '1' then
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
