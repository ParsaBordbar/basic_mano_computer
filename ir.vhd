library IEEE;
use IEEE.std_logic_1164.all;

entity IR is port (
	data : in std_logic_vector(15 downto 0);
	clk : in std_logic;
	IRload : in std_logic;
	IRout : out std_logic_vector(15 downto 0)
);
end entity;

architecture rtl of IR is 
begin
	process(clk)
	begin
		if (clk'event and clk = '1' and IRload = '1') then
			IRout <= data;
		end if;
	end process;
end architecture;