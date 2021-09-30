library ieee;
use ieee.std_logic_1164.all;

entity selector is
	port (
		led: in std_logic_vector(7 downto 0);
		index: out integer range 0 to 7
	);
end selector;

architecture arch of selector is
	type index_array is array(0 to 7) of integer range 0 to 7;
begin
	process(led)
		variable indexes: index_array;
	begin
		
	end process;
end arch;
