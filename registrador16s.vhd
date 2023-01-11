library ieee; 
use ieee.std_logic_1164.all; 

entity registrador16s is port ( 
		CLK, RST, EN: in std_logic; 
		D: in std_logic_vector(15 downto 0); 
		Q: out std_logic_vector(15 downto 0) 
		); 
end registrador16s; 

architecture registrador of registrador16s is 
begin
	process(CLK, D, RST) 
	begin 
		if RST = '1' then 
			Q <= "0000000000000000"; 
		elsif (CLK'event and CLK = '1') then 
			if EN = '1' then 
				Q <= D; 
			end if; 
		end if; 
	end process; 
end registrador; 