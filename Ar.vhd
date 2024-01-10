library ieee;
use ieee.std_logic_1164.all;

entity Address_Register is
    Port (
        clk : in std_logic;
        reset : in std_logic;
        load : in std_logic;
        data_in : in std_logic_vector(15 downto 0);
        data_out : out std_logic_vector(15 downto 0)
    );
end Address_Register;

architecture Behavioral of Address_Register is
begin
    process(clk, reset)
    begin
        if reset = '1' then
            data_out <= (others => '0');
        elsif rising_edge(clk) then
            if load = '1' then
                data_out <= data_in;
            end if;
        end if;
    end process;
end Behavioral;
