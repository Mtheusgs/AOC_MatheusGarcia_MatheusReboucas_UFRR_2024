library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Sign_Extender_2_TB is
end Sign_Extender_2_TB;

architecture Behavioral of Sign_Extender_2_TB is
    -- Component Declaration
    component Sign_Extender_2
        Port (
            short_address : in std_logic_vector(2 downto 0);
            extended_address : out std_logic_vector(7 downto 0)
        );
    end component;

    -- Signals for testing
    signal short_address : std_logic_vector(2 downto 0);
    signal extended_address : std_logic_vector(7 downto 0);

begin
    -- Instantiate the Sign Extender
    UUT: Sign_Extender_2 port map (
        short_address => short_address,
        extended_address => extended_address
    );

    -- Stimulus Process
    process
    begin
        -- Test Case 1: 000 (Expect 00000000)
        short_address <= "000";
        wait for 10 ns;

        -- Test Case 2: 001 (Expect 00000001)
        short_address <= "001";
        wait for 10 ns;

        -- Test Case 3: 010 (Expect 00000010)
        short_address <= "010";
        wait for 10 ns;

        -- Test Case 4: 011 (Expect 00000011)
        short_address <= "011";
        wait for 10 ns;

        -- Test Case 5: 100 (Expect 00000100)
        short_address <= "100";
        wait for 10 ns;

        -- Test Case 6: 101 (Expect 00000101)
        short_address <= "101";
        wait for 10 ns;

        -- Test Case 7: 110 (Expect 00000110)
        short_address <= "110";
        wait for 10 ns;

        -- Test Case 8: 111 (Expect 00000111)
        short_address <= "111";
        wait for 10 ns;

        -- End simulation
        wait;
    end process;
end Behavioral;
