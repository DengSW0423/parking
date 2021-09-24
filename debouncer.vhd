library ieee;
use ieee.std_logic_1164.all;

entity debouncer is
	port(
		clk_100hz: in std_logic;
		btn_in: in std_logic;
		btn_out: out std_logic
	);
end debouncer;

architecture arch of debouncer is
begin
	process(clk_100hz)
		variable count: integer range 0 to 5;
		variable btn_out_t: std_logic;
	begin
		if rising_edge(clk_100hz) then
			if btn_in = '1' then
				if count = 5 then
					count := count;
				else
					count := count + 1;
				end if;
				
				if count = 4 then
					btn_out_t := '1';
				else
					btn_out_t := '0';
				end if;
			else
				count := 0;
			end if;
		end if;
		
		btn_out <= btn_out_t;
	end process;
	
end arch;
