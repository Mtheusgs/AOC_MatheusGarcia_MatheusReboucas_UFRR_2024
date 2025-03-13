library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity ProgramCounter is
    port (
        Clock, Reset : in std_logic;
        BranchTaken, Jump : in std_logic;
        BranchOffset, JumpAddress : in std_logic_vector(7 downto 0);
        PC : out std_logic_vector(7 downto 0)
    );
end ProgramCounter;

architecture Behavioral of ProgramCounter is
    signal PC_reg : std_logic_vector(7 downto 0) := (others => '0');
begin
    process (Clock, Reset)
    begin
        if Reset = '1' then
            PC_reg <= (others => '0');
        elsif rising_edge(Clock) then
            if Jump = '1' then
                PC_reg <= JumpAddress;
            elsif BranchTaken = '1' then
                PC_reg <= PC_reg + BranchOffset;
            else
                PC_reg <= PC_reg + 1;
            end if;
        end if;
    end process;
    PC <= PC_reg;
end Behavioral;
