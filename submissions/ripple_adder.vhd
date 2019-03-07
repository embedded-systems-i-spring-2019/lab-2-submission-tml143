

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ripple_adder is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Cout : out STD_LOGIC);
end ripple_adder;


architecture Behavioral of ripple_adder is

component full_adder
Port(
B : in STD_LOGIC;
A : in STD_LOGIC;
CIN : in STD_LOGIC;
S : out STD_LOGIC;
COUT : out STD_LOGIC
);
end component;
signal wire : std_logic_vector(3 downto 0);
begin
wire(0)<=Cin;

adder0: full_adder
port map(
B => B(0),
A=> A(0),
CIN=> wire(0),
S=> s(0),
COUT => wire(1)
);

adder1: full_adder
port map(
B => B(1),
A=> A(1),
CIN=> wire(1),
S=> s(1),
COUT => wire(2)
);
adder2: full_adder
port map(
B => B(2),
A=> A(2),
CIN=> wire(2),
S=> s(2),
COUT => wire(3)
);

adder3: full_adder
port map(
B => B(3),
A=> A(3),
CIN=> wire(3),
S=> s(3),
COUT => cout
);

end Behavioral;
