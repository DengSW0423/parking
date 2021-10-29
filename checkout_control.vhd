library ieee;
use ieee.std_logic_1164.all;
use work.my_package.all;

entity checkout_control is
	port(
		clk_1000hz: in std_logic;
		clk_1hz: in std_logic;
		check_out: in std_logic; --btn0
		beep: out std_logic;
		disp_blinking: buffer boolean
	);
end checkout_control;

architecture arch of checkout_control is
begin	
	process(clk_1000hz)
		variable count: integer range 0 to 1000 := 0;
	begin
		if rising_edge(clk_1000hz) then
			if check_out = '1' then
				count := 1;
			end if;
			
			if count /= 0 then
				if count = 1000 then
					count := 0;
				else
					count := count + 1;
				end if;
				disp_blinking <= true;
			else
				disp_blinking <= false;
			end if;
		end if;
	end process;
	
	process(disp_blinking, clk_1000hz)
	begin
		if disp_blinking then
			beep <= clk_1000hz;
		else
			beep <= '1';
		end if;
	end process;
end arch;
