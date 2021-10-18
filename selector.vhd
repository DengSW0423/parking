library ieee;
use ieee.std_logic_1164.all;
use work.my_package.all;

entity selector is
	port (
		check_out: in std_logic;
		led: in std_logic_vector(7 downto 0);
		to_check_out: out boolean_array
	);
end selector;

architecture arch of selector is
begin
	
	process(led, check_out)
		variable to_check_out_t: boolean_array;
		variable to_check_out_t1: boolean_array;
	begin
		for i in 7 downto 0 loop
			if rising_edge(led(i)) then
				to_check_out_t(i) := true;
			end if;
		end loop;
		to_check_out <= to_check_out_t;
		
		if check_out = '1' then
			to_check_out_t1 := to_check_out_t;
			for i in 7 downto 0 loop
				if to_check_out_t1(i) then
					to_check_out_t1(i) := false;
					exit;
				end if;
			end loop;
			to_check_out <= to_check_out_t1;
		end if;
		
	end process;

end arch;
