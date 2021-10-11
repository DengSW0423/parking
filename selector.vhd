library ieee;
use ieee.std_logic_1164.all;
use work.my_package.all;

entity selector is
	port (
		led: in std_logic_vector(7 downto 0);
		to_check_out: out boolean_array
	);
end selector;

architecture arch of selector is
begin
	process(led(0))
	begin
		if rising_edge(led(0)) then
			to_check_out(0) <= true;
		end if;
	end process;
	
	process(led(1))
	begin
		if rising_edge(led(1)) then
			to_check_out(1) <= true;
		end if;
	end process;

	process(led(7))
	begin
		if rising_edge(led(7)) then
			to_check_out(7) <= true;
		end if;
	end process;
	
	process(led(2))
	begin
		if rising_edge(led(2)) then
			to_check_out(2) <= true;
		end if;
	end process;
	
	process(led(3))
	begin
		if rising_edge(led(3)) then
			to_check_out(3) <= true;
		end if;
	end process;
	
	process(led(4))
	begin
		if rising_edge(led(4)) then
			to_check_out(4) <= true;
		end if;
	end process;
	
	process(led(5))
	begin
		if rising_edge(led(5)) then
			to_check_out(5) <= true;
		end if;
	end process;
	
	process(led(6))
	begin
		if rising_edge(led(6)) then
			to_check_out(6) <= true;
		end if;
	end process;
end arch;
