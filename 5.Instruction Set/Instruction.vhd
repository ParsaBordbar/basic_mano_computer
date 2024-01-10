library IEEE;
use IEEE.std_logic_1164.all;

-- Instruction Decoder
entity instruction_decoder is
    port (
        opcode : in std_logic_vector (3 downto 0);
        instruction : out std_logic_vector (7 downto 0)
    );
end instruction_decoder;

architecture behavior of instruction_decoder is
begin
    process (opcode)
    begin
        case opcode is
            when "0001" => instruction <= "10000001"; -- LDA
            when "0010" => instruction <= "01000010"; -- STA
            when "0011" => instruction <= "00100100"; -- ADD
            when "0100" => instruction <= "00011000"; -- SUB
            when "0101" => instruction <= "00000100"; -- AND
            when "0110" => instruction <= "00000010"; -- OR
            when "0111" => instruction <= "00000001"; -- NOT
            when others => instruction <= "00000000"; -- NOP
        end case;
    end process;
end behavior;
