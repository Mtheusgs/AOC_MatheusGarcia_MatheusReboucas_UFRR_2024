library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Instruction_Memory is
    port (
        Address : in std_logic_vector(7 downto 0);
        Instruction : out std_logic_vector(7 downto 0)
    );
end Instruction_Memory;

architecture Behavioral of Instruction_Memory is
    type mem_array is array (0 to 15) of std_logic_vector(7 downto 0);
    signal ROM : mem_array := (
        others => "00000000"
    );
begin
    -- Convert Address to integer using numeric_std functions
    Instruction <= ROM(to_integer(unsigned(Address)));
end Behavioral;
