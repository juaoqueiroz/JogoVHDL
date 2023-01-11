library ieee; 
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity counter_round is port( 
	clock, R, E: in std_logic;
	X: out std_logic_vector(3 downto 0); 
	end_round: out std_logic); 
end counter_round; 

architecture contador of counter_round is 
	signal tot: std_logic_vector(3 downto 0);

begin 
	-- Registrador e Somador:
	
	process(clock, R, E)
	begin 
		if (R = '1') then 
			tot <= "1111"; 
		elsif (clock'event AND clock = '1') then 
			if (E = '1') then 
				tot <= tot - 1; 
			end if; 
		end if; 
	end process; 
	X <= tot; 
	
	-- Comparador: 
	
	end_round <= '1' when (tot=0) else
 '0';
end contador; 