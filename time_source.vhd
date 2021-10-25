library ieee;
use ieee.std_logic_1164.all;
use work.my_package.all;

entity time_source is
	port(
		times: in time_array;
		rst: in std_logic; --btn7
		check_out: in std_logic; --btn0
		switches: in std_logic_vector(7 downto 0);
		matrix_blinking: out boolean;
		led_blinking: out boolean;
		led_index: out integer range 0 to 7;
		time_out: out integer range 0 to 100
	);
end time_source;

architecture arch of time_source is
begin

	process(times, rst, check_out, switches)
	begin
		for i in 7 downto 0 loop
			if times(i) /= 0 then
				time_out <= times(i);
				
				if rst = '1' or check_out = '1' then
					matrix_blinking <= false;
					led_blinking <= false;
				elsif switches(i) = '0' then
					matrix_blinking <= true;
					led_blinking <= true;
				else
					matrix_blinking <= false;
					led_blinking <= false;
				end if;
				led_index <= i;
				
				exit;
			end if;
			time_out <= 0;
		end loop;
	end process;
	
end arch;
