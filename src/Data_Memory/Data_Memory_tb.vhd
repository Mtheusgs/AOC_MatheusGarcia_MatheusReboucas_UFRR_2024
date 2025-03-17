library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Data_Memory_tb is
end Data_Memory_tb;

architecture Behavioral of Data_Memory_tb is
    -- Component Declaration for Unit Under Test (UUT)
    component Data_Memory
        port (
            Clock : in std_logic;
            Address : in std_logic_vector(7 downto 0);
            WriteData : in std_logic_vector(7 downto 0);
            MemRead, MemWrite : in std_logic;
            ReadData : out std_logic_vector(7 downto 0)
        );
    end component;

    -- Signals for Testbench
    signal Clock : std_logic := '0';
    signal Address : std_logic_vector(7 downto 0);
    signal WriteData : std_logic_vector(7 downto 0);
    signal MemRead, MemWrite : std_logic;
    signal ReadData : std_logic_vector(7 downto 0);

    -- Clock Generation
    constant CLK_PERIOD : time := 10 ns;  -- Adjust as needed

begin
    -- Instantiate UUT (Unit Under Test)
    UUT: Data_Memory
    port map (
        Clock => Clock,
        Address => Address,
        WriteData => WriteData,
        MemRead => MemRead,
        MemWrite => MemWrite,
        ReadData => ReadData
    );

    -- Clock Process
    process
    begin
        while now < 200 ns loop
            Clock <= '0';
            wait for CLK_PERIOD / 2;
            Clock <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- Stimulus Process
    process
    begin
        -- Initialize Signals
        MemRead <= '0';
        MemWrite <= '0';
        Address <= (others => '0');
        WriteData <= (others => '0');
        wait for 20 ns;

        -- Write 0xA5 to Address 0
        Address <= "00000000";  
        WriteData <= "10100101";  
        MemWrite <= '1';  
        wait for CLK_PERIOD;
        MemWrite <= '0';  

        -- Write 0x3C to Address 1
        Address <= "00000001";  
        WriteData <= "00111100";  
        MemWrite <= '1';  
        wait for CLK_PERIOD;
        MemWrite <= '0';

        -- Write 0xFF to Address 15
        Address <= "00001111";  
        WriteData <= "11111111";  
        MemWrite <= '1';  
        wait for CLK_PERIOD;
        MemWrite <= '0';

        -- Read Address 0
        Address <= "00000000";  
        MemRead <= '1';  
        wait for CLK_PERIOD;
        MemRead <= '0';

        -- Read Address 1
        Address <= "00000001";  
        MemRead <= '1';  
        wait for CLK_PERIOD;
        MemRead <= '0';

        -- Read Address 15
        Address <= "00001111";  
        MemRead <= '1';  
        wait for CLK_PERIOD;
        MemRead <= '0';

        -- Try to Read Address 16 (Invalid)
        Address <= "00010000";  
        MemRead <= '1';  
        wait for CLK_PERIOD;
        MemRead <= '0';

        -- Test No Write When MemWrite = 0
        Address <= "00000010";  
        WriteData <= "01010101";  
        MemWrite <= '0';  
        wait for CLK_PERIOD;

        -- Try Reading Address 2 (Should be 0x00)
        Address <= "00000010";  
        MemRead <= '1';  
        wait for CLK_PERIOD;
        MemRead <= '0';

        -- Test No Read When MemRead = 0
        Address <= "00000000";  
        MemRead <= '0';  
        wait for CLK_PERIOD;

        -- End Simulation
        wait;
    end process;
end Behavioral;
