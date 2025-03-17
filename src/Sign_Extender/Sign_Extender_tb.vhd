library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Sign_Extender_tb is
end Sign_Extender_tb;

architecture Behavioral of Sign_Extender_tb is
    -- Component declaration
    component Sign_Extender
        Port (
            short_address : in std_logic_vector(4 downto 0);
            extended_address : out std_logic_vector(7 downto 0)
        );
    end component;

    -- Signals for testbench
    signal short_address_tb : std_logic_vector(4 downto 0);
    signal extended_address_tb : std_logic_vector(7 downto 0);

begin
    -- Instantiate the Sign_Extender module
    uut: Sign_Extender
        port map (
            short_address => short_address_tb,
            extended_address => extended_address_tb
        );

    -- Test process
    process
    begin
        -- Test case 1: short_address = "00000"
        short_address_tb <= "00000";
        wait for 10 ns;
        assert (extended_address_tb = "00000000") 
            report "Test case 1 failed!" severity error;

        -- Test case 2: short_address = "00001"
        short_address_tb <= "00001";
        wait for 10 ns;
        assert (extended_address_tb = "00000001") 
            report "Test case 2 failed!" severity error;

        -- Test case 3: short_address = "10000"
        short_address_tb <= "10000";
        wait for 10 ns;
        assert (extended_address_tb = "00010000") 
            report "Test case 3 failed!" severity error;

        -- Test case 4: short_address = "11111"
        short_address_tb <= "11111";
        wait for 10 ns;
        assert (extended_address_tb = "00011111") 
            report "Test case 4 failed!" severity error;

        -- End simulation
        report "All test cases passed!" severity note;
        wait;
    end process;
end Behavioral;
