library IEEE;
use IEEE.std_logic_1164.all;

-- Temporary Register (TR)
entity temp_register is
    port (
        clk : in std_logic;
        load : in std_logic;
        input : in std_logic_vector (15 downto 0);
        output : out std_logic_vector (15 downto 0)
    );
end temp_register;

architecture behavior of temp_register is
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if load = '1' then
                output <= input;
            end if;
        end if;
    end process;
end behavior;
