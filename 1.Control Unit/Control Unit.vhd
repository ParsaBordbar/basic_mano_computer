entity control_unit is
    port (
        opcode : in std_logic_vector (3 downto 0);
        controls : out std_logic_vector (7 downto 0)
    );
end control_unit;

architecture behavior of control_unit is
begin
    process (opcode)
    begin
        case opcode is
            when "0001" => controls <= "10000001"; -- LDA
            when "0010" => controls <= "01000010"; -- STA
            when "0011" => controls <= "00100100"; -- ADD
            when "0100" => controls <= "00011000"; -- SUB
            when others => controls <= "00000000"; -- NOP
        end case;
    end process;
end behavior;
