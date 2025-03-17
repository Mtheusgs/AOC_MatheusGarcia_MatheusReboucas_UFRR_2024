LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY Program_Counter_tb IS
END Program_Counter_tb;

ARCHITECTURE behavior OF Program_Counter_tb IS

    -- Component Declaration for the PC
    COMPONENT Program_Counter
        PORT (
            clk        : IN std_logic;
            rst        : IN std_logic;
            Branch     : IN std_logic;
            Zero       : IN std_logic;
            Jump       : IN std_logic;
            PC_offset  : IN std_logic_vector(7 downto 0);
            Jump_addr  : IN std_logic_vector(7 downto 0);
            PC_out     : OUT std_logic_vector(7 downto 0)
        );
    END COMPONENT;

    -- Testbench Signals
    SIGNAL clk_tb        : std_logic := '0';
    SIGNAL rst_tb        : std_logic := '0';
    SIGNAL Branch_tb     : std_logic := '0';
    SIGNAL Zero_tb       : std_logic := '0';
    SIGNAL Jump_tb       : std_logic := '0';
    SIGNAL PC_offset_tb  : std_logic_vector(7 downto 0) := (others => '0');
    SIGNAL Jump_addr_tb  : std_logic_vector(7 downto 0) := (others => '0');
    SIGNAL PC_out_tb     : std_logic_vector(7 downto 0);

    -- Clock Period
    CONSTANT clk_period : time := 10 ns;

BEGIN

    -- Instantiate the PC Component
    uut: Program_Counter PORT MAP (
        clk        => clk_tb,
        rst        => rst_tb,
        Branch     => Branch_tb,
        Zero       => Zero_tb,
        Jump       => Jump_tb,
        PC_offset  => PC_offset_tb,
        Jump_addr  => Jump_addr_tb,
        PC_out     => PC_out_tb
    );

    -- Clock Process
    clk_process : PROCESS
    BEGIN
        WHILE NOW < 200 ns LOOP  -- Simulate for 200 ns
            clk_tb <= '0';
            WAIT FOR clk_period/2;
            clk_tb <= '1';
            WAIT FOR clk_period/2;
        END LOOP;
        WAIT;
    END PROCESS;

    -- Test Process
    stim_proc: PROCESS
    BEGIN
        -- Reset PC
        rst_tb <= '1';
        WAIT FOR 20 ns;
        rst_tb <= '0';
        
        -- Normal Increment
        WAIT FOR 30 ns;

        -- Test Branch (Only if Zero = 1)
        Zero_tb <= '1';
        Branch_tb <= '1';
        PC_offset_tb <= "00001100"; -- Offset to 12
        WAIT FOR clk_period;
        Branch_tb <= '0';
        Zero_tb <= '0';

        -- Test Jump
        WAIT FOR 30 ns;
        Jump_tb <= '1';
        Jump_addr_tb <= "00101000"; -- Jump to address 40
        WAIT FOR clk_period;
        Jump_tb <= '0';

        -- Continue Normal Execution
        WAIT FOR 30 ns;

        -- Finish Simulation
        WAIT;
    END PROCESS;

END behavior;
