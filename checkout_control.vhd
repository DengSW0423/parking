library ieee;
use ieee.std_logic_1164.all;
use work.my_package.all;

entity checkout_control is
	port(
		clk_100hz: in std_logic;
		check_out: in std_logic; --btn0
		beep: out std_logic;
		to_check_out: in boolean_array;
		to_disp: out boolean_array;
		checked_out: buffer boolean
	);
end checkout_control;

architecture arch of checkout_control is
	signal checkout_debounced: std_logic;
begin
	t1: debouncer port map(clk_100hz, check_out, checkout_debounced);
	
	process(checkout_debounced)
		variable to_disp_temp: boolean_array;
	begin
		if rising_edge(checkout_debounced) then
			checked_out <= true;
			
			to_disp_temp := to_check_out;
			for i in 7 downto 0 loop
				if to_check_out(i) then
					to_disp_temp(i) := false;
					exit;
				end if;
			end loop;
			to_disp <= to_disp_temp;
		
		end if;
	end process;
	
	process(clk_100hz)
		variable count: integer range 0 to 100;
	begin
		if rising_edge(clk_100hz) then
			if checked_out = true then
				if count = 100 then
					beep <= '0';
				else
					beep <= '1';
					count := count + 1;
				end if;
			else
				beep <= '0';
				count := 0;
			end if;
		end if;
	end process;
end arch;
