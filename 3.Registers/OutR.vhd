library IEEE;
use IEEE.std_logic_1164.all;

-- Output Register (OUTR)
entity output_register is
    port (
        clk : in std_logic;
        load : in std_logic;
        input : in std_logic_vector (15 downto 0);
        output : out std_logic_vector (15 downto 0)
    );
end output_register;

architecture behavior of output_register is
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