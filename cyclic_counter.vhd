library ieee;
use ieee.std_logic_1164.all;
use work.my_package.all;

entity cyclic_counter is
	port(
		rst: in std_logic;
		clk_1hz: in std_logic;
		number: buffer integer range 0 to 23
	);
end cyclic_counter;

architecture arch of cyclic_counter is
begin	
	process(clk_1hz, rst)
	begin
		if rst = '1' then
			number <= 0;
		elsif rising_edge(clk_1hz) then
			if number = 23 then
				number <= 0;
			else
				number <= number + 1;
			end if;
		end if;
	end process;
end arch;
