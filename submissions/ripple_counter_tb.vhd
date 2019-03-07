

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity ripple_counter_tb is

end ripple_counter_tb;

architecture Behavioral of ripple_counter_tb is

component ripple_adder is
Port 
(A : in STD_LOGIC_VECTOR (3 downto 0);
 B : in STD_LOGIC_VECTOR (3 downto 0);
 Cin : in STD_LOGIC;
 S : out STD_LOGIC_VECTOR (3 downto 0);
 Cout : out STD_LOGIC);
end component;
signal A,B: std_logic_vector( 3 downto 0) := (others => '0');
signal S: std_logic_vector( 3 downto 0);
signal cin: std_logic := '0';
signal cout: std_logic;
begin

UUT: ripple_adder
Port map(
A => A,
B=> B,
cin => cin,
s=>S,
cout =>cout
);

stimulus : process
begin


cin <='0';

 A <= "1111";
 B <= "1111";
wait for 100 ns;

 A <= "0000";
 B <= "0000";
wait for 100 ns;

 A<= "0110";
 B<= "0110";



wait for 40 ns;
wait;
end process;

end Behavioral;
