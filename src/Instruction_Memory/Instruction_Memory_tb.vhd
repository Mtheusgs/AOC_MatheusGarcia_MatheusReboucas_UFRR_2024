library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Instruction_Memory_tb is
end Instruction_Memory_tb;

architecture Behavioral of Instruction_Memory_tb is

    -- Component declaration for the Unit Under Test (UUT)
    component Instruction_Memory
        port (
            Address     : in std_logic_vector(7 downto 0);
            Instruction : out std_logic_vector(7 downto 0)
        );
    end component;

    -- Signals to connect to the UUT
    signal Address     : std_logic_vector(7 downto 0);
    signal Instruction : std_logic_vector(7 downto 0);

begin

    -- Instantiate the UUT
    UUT: Instruction_Memory
        port map (
            Address     => Address,
            Instruction => Instruction
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test cases
        Address <= "00000000";  -- Address 0
        wait for 10 ns;
        Address <= "00000001";  -- Address 1
        wait for 10 ns;
        Address <= "00000010";  -- Address 2
        wait for 10 ns;
        Address <= "00001111";  -- Address 15
        wait for 10 ns;
        Address <= "00010000";  -- Out of range (wrap-around if memory is smaller)
        wait for 10 ns;

        -- End simulation
        wait;
    end process;

end Behavioral;
