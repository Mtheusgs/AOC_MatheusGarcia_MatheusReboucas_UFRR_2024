library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity InstructionMemory is
    port (
        Address : in std_logic_vector(7 downto 0);
        Instruction : out std_logic_vector(7 downto 0)
    );
end InstructionMemory;

architecture Behavioral of InstructionMemory is
    type mem_array is array (0 to 15) of std_logic_vector(7 downto 0);
    signal ROM : mem_array := (
        "00001000", -- ADD R1, R2, R3
        "00011001", -- SUB R1, R3
        "10000010", -- SLT R2, R0
        "11000011", -- JUMP 3
        others => "00000000"
    );
begin
    Instruction <= ROM(to_integer(unsigned(Address)));
end Behavioral;
