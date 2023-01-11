library ieee; 
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all; 
--use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_signed.all;

entity counter_time is port( 
	clock, R, E: in std_logic;
	step: in std_logic_vector(7 downto 0);
	T_out: out std_logic_vector(7 downto 0); 
	end_time: out std_logic); 
end counter_time; 

architecture contador of counter_time is 
	signal tot: std_logic_vector(7 downto 0);

begin 
	-- Registrador e Somador:
	--tot <= "01100011";
	process(clock, R, E,step)
	begin 
		if (R = '1') then 
			tot <= "01100011"; 
		elsif (clock'event AND clock = '1') then 
			if (E = '1') then 
				tot <= tot + step; 
			end if; 
		end if; 
	end process; 
	T_out <= tot; 
	
	-- Comparador: 
	
	end_time <= '1' when tot < 1 else 
			'0';
end contador; 