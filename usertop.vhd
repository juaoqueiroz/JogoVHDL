library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all; 

entity usertop is port(

    SW: in std_logic_vector(17 downto 0);
	 KEY: in std_logic_vector(3 downto 0);
    CLK_500Hz: in std_logic;
    HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0: out std_logic_vector(6 downto 0);
    LEDR: out std_logic_vector(17 downto 0));

end usertop;

architecture circuito of usertop is

-- signals padronizados. Favor utilizar estes.
signal CLK: std_logic;
signal R1, E1, E2, E3, E4, E5, E6: std_logic;
signal Enter_left,Enter_right,end_game, end_sequence, end_round, end_left, end_right, enter, reset: std_logic;


component ButtonPlay is port(
    KEY1, KEY0: in  std_logic;
    Reset, clk: in  std_Logic;
    BTN1, BTN0: out std_logic); 
end component;

component ButtonSync is port(
    KEY1, KEY0, CLK: in  std_logic;
    BTN1, BTN0   : out std_logic); 
end component;

component controle  is port(
   clock, reset, enter, end_game, end_sequence, end_round, enter_left, enter_right: in std_logic;
	R1, E1, E2, E3, E4, E5, E6: out std_logic);
end component;

component datapath is port(
    SW: in std_logic_vector(17 downto 0);
    CLK: in std_logic;
	 Enter_left, Enter_right: in std_logic;
    R1, E1, E2, E3, E4, E5, E6: in std_logic;
	 end_game, end_sequence, end_round, end_left, end_right: out std_logic;
    HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0: out std_logic_vector(6 downto 0);
    LEDR: out std_logic_vector(17 downto 0));
end component;




------------------------completar os components que faltam------------------------------

begin
CLK <= CLK_500Hz;

b1: ButtonPlay port map(KEY(3),KEY(2),E2,CLK,Enter_left,Enter_right);
b2: ButtonSync port map(KEY(1),KEY(0),CLK,enter,reset);


control: controle port map(CLK,reset,enter,end_game,end_sequence, end_round, end_left, end_right,
R1, E1, E2, E3, E4, E5, E6);


data: datapath port map(SW(17 downto 0),CLK,Enter_left,Enter_right,R1,E1,E2,E3,E4,E5,E6,end_game,
 end_sequence, end_round, end_left, end_right,HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0,LEDR(17 downto 0));



end circuito;
