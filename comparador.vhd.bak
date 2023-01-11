LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY comparador IS
	PORT (
		A, B : IN std_logic_vector(0 downto 7);
		output : OUT std_logic
	);
END comparador;

ARCHITECTURE arch OF comparador IS
BEGIN
	PROCESS (A, B)
	BEGIN
		IF A = B THEN
			output <= '1';
		ELSE
			output <= '0';
		END IF;
	END PROCESS;
END arch;