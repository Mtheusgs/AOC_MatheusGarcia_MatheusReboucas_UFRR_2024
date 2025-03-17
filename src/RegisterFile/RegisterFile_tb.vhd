library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RegisterFile_tb is
end RegisterFile_tb;

architecture test of RegisterFile_tb is
    -- Test signals
    signal Clock      : std_logic := '0';
    signal ReadReg1   : std_logic_vector(1 downto 0) := "00";
    signal ReadReg2   : std_logic_vector(1 downto 0) := "00";
    signal WriteData  : std_logic_vector(7 downto 0) := (others => '0');
    signal RegWrite   : std_logic := '0';
    signal ReadData1  : std_logic_vector(7 downto 0);
    signal ReadData2  : std_logic_vector(7 downto 0);

    -- Instantiate the Register File
    component RegisterFile
        port (
            Clock     : in std_logic;
            ReadReg1  : in std_logic_vector(1 downto 0);
            ReadReg2  : in std_logic_vector(1 downto 0);
            WriteData : in std_logic_vector(7 downto 0);
            RegWrite  : in std_logic;
            ReadData1 : out std_logic_vector(7 downto 0);
            ReadData2 : out std_logic_vector(7 downto 0)
        );
    end component;

begin
    -- Connect DUT (Device Under Test)
    uut: RegisterFile port map (
        Clock     => Clock,
        ReadReg1  => ReadReg1,
        ReadReg2  => ReadReg2,
        WriteData => WriteData,
        RegWrite  => RegWrite,
        ReadData1 => ReadData1,
        ReadData2 => ReadData2
    );

    -- Clock process (period = 10ns)
    process
    begin
        while now < 100 ns loop
            Clock <= '0';
            wait for 5 ns;
            Clock <= '1';
            wait for 5 ns;
        end loop;
        wait;
    end process;

    -- Test Process
    process
    begin
        -- Test 1: Ensure initial values are 0
        ReadReg1 <= "01";  -- Check R1
        ReadReg2 <= "10";  -- Check R2
        wait for 10 ns;

        -- Test 2: Write 42 (00101010) to R1
        ReadReg1  <= "01";  -- Destination
        WriteData <= "00101010"; -- 42
        RegWrite  <= '1';  -- Enable write
        wait for 10 ns;
        RegWrite  <= '0';  -- Disable write

        -- Test 3: Write 100 (01100100) to R2
        ReadReg1  <= "10";  -- Destination
        WriteData <= "01100100"; -- 100
        RegWrite  <= '1';  -- Enable write
        wait for 10 ns;
        RegWrite  <= '0';  -- Disable write

        -- Test 4: Read from R1 and R2
        ReadReg1 <= "01";  -- Expect 42
        ReadReg2 <= "10";  -- Expect 100
        wait for 10 ns;

        -- Test 5: Attempt to write to R0 (should be ignored)
        ReadReg1  <= "00";  -- Destination (R0)
        WriteData <= "11111111"; -- 255
        RegWrite  <= '1';  -- Enable write
        wait for 10 ns;
        RegWrite  <= '0';  -- Disable write

        -- Read R0 to check if it remains 0
        ReadReg1 <= "00";
        wait for 10 ns;

        -- End Simulation
        wait;
    end process;
end test;
