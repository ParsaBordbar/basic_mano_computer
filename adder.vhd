library IEEE;
use IEEE.std_logic_1164.all;

entity adder is port(
  a , b , cin : in std_logic;
  s , cout : out std_logic);
end entity;

architecture struct of adder is   
begin 
  s <= a xor b xor cin;
  cout <= (a and b) or (a and cin) or (b and cin);
end architecture;
  