library ieee;
use ieee.std_logic_1164.all;

entity debouncer is
	port(
		clk_1000hz: in std_logic;
		btn_in: in std_logic;
		btn_out: out std_logic
	);
end debouncer;

architecture arch of debouncer is
begin
	process(clk_1000hz, btn_in)
		variable count: integer range 0 to 20;
	begin
		if btn_in = '1' then
			if rising_edge(clk_1000hz) then
				if count = 20 then
					count := 20;
				else
					count := count + 1;
				end if;
				
				if count = 19 then
					btn_out <= '1';
				else
					btn_out <= '0';
				end if;
			end if;
		else
			count := 0;
			btn_out <= '0';
		end if;
	end process;
end arch;
