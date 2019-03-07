

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity alu_tester is
    Port ( switch : in STD_LOGIC_VECTOR (3 downto 0);
           button : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in std_logic;
           LED : out STD_LOGIC_VECTOR (3 downto 0));
    end alu_tester;



architecture Behavioral of alu_tester is

component my_alu
port(
A : in STD_LOGIC_VECTOR (3 downto 0);
B : in STD_LOGIC_VECTOR (3 downto 0);
opcode : in STD_LOGIC_VECTOR (3 downto 0);
output : out STD_LOGIC_VECTOR (3 downto 0)
);
end component;

component debounce
    Port ( BTN : in STD_LOGIC;
           CLK : in STD_LOGIC;
           DBNC : out STD_LOGIC);
end component;

signal s_dbnc : std_logic_vector(3 downto 0);
signal s_opcode, s_a, s_b : std_logic_vector ( 3 downto 0);
begin

process(clk)
begin
if (rising_edge(clk)) then
if s_dbnc(3) ='1' then
s_opcode <="0000";
s_a <="0000"; 
s_b<="0000" ; 
else
    if s_dbnc(2) ='1' then s_opcode <= switch; end if;
    if s_dbnc(1) ='1' then s_a<= switch; end if;
    if s_dbnc(0) ='1' then s_b <= switch; end if;
    
       end if;
end if;
end process;


btn3: debounce
port map(
btn => button(3),
clk => clk,
dbnc => s_dbnc(3)
);
btn2: debounce
port map(
btn => button(2),
clk => clk,
dbnc => s_dbnc(2)
);
btn1: debounce
port map(
btn => button(1),
clk => clk,
dbnc => s_dbnc(1)
);
btn0: debounce
port map(
btn => button(0),
clk => clk,
dbnc => s_dbnc(0)
);
alu: my_alu
port map(
A => s_a,
B => s_b,
opcode => s_opcode,
output => LED
);


end Behavioral;
