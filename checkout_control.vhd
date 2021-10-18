library ieee;
use ieee.std_logic_1164.all;
use work.my_package.all;

entity checkout_control is
	port(
		clk_100hz: in std_logic;
		clk_1hz: in std_logic;
		check_out: in std_logic; --btn0
		beep: out std_logic;
		blinking: out boolean;
		checked_out: buffer boolean
	);
end checkout_control;

architecture arch of checkout_control is
begin	
	process(check_out)
	begin
		
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
