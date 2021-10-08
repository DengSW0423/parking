library ieee;
use ieee.std_logic_1164.all;

entity selector is
	port (
		led: in std_logic_vector(7 downto 0);
		indexs: out index_array;
	);
end selector;

architecture arch of selector is
	type index_array is array(0 to 7) of integer range 0 to 1;
begin
	process(led)
	begin
		for i in 7 downto 0 loop
			if rising_edge(led(i)) then
				indexs(i) <= 1; --wait for displaying.
			else
				indexs(i) <= 0;
			end if;
		end loop;
	end process;
end arch;
