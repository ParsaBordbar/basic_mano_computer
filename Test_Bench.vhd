library ieee;
use ieee.std_logic_1164.all;

entity mano_computer_tb is
end mano_computer_tb;

architecture behavior of mano_computer_tb is
    component mano_computer is
    end component;

    -- Declare signals for the testbench
    signal tb_bus : std_logic_vector (15 downto 0);

begin
    -- Instantiate the design under test (DUT)
    DUT: mano_computer
        port map (
            bus => tb_bus
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Insert stimulus here
        -- For example, you can set the bus signal to a specific value:
        tb_bus <= "0000000000000000";
        wait for 10 ns;
        tb_bus <= "0000000000000001";
        wait for 10 ns;
        -- Continue this pattern as needed for your test

        wait;
    end process;
end behavior;
