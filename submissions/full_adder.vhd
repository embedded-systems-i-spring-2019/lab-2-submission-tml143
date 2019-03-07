

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity full_adder is
    Port ( B : in STD_LOGIC;
           A : in STD_LOGIC;
           CIN : in STD_LOGIC;
           S : out STD_LOGIC;
           COUT : out STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is
signal wire0, wire1, wire2 : std_logic;
begin


wire0 <= a xor b;
S<= wire0 xor CIN;
wire1 <= cin and wire0;
wire2 <= a and b;
cout <= wire1 or wire2;


end Behavioral;
