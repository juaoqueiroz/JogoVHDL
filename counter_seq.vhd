library ieee; 
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity counter_seq is port( 
	clock, R, E: in std_logic;
	seq: out std_logic_vector(1 downto 0); 
	end_sequence: out std_logic); 
end counter_seq; 

architecture contador of counter_seq is 
	signal tot: std_logic_vector(1 downto 0);

begin 
	-- Registrador e Somador:
	
	process(clock, R, E)
	begin
		if (R = '1') then 
			tot <= "00"; 
		elsif (clock'event AND clock = '1') then 
			if (E = '1') then 
				tot <= tot + 1; 
			end if; 
		end if; 
	end process; 
	seq <= tot; 
	
	-- Comparador: 
	
	end_sequence <= '1' when (tot=4) else
 '0';
end contador; 