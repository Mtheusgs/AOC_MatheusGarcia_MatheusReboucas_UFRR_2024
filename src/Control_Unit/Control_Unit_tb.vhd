library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Control_Unit_tb is
end Control_Unit_tb;

architecture Behavioral of Control_Unit_tb is
    -- Component declaration for the Unit Under Test (UUT)
    component Control_Unit
        Port (
            opcode   : in  STD_LOGIC_VECTOR (2 downto 0);
            RegWrite : out STD_LOGIC;
            ALUSrc   : out STD_LOGIC;
            ALUOp    : out STD_LOGIC_VECTOR (1 downto 0);
            MemRead  : out STD_LOGIC;
            MemWrite : out STD_LOGIC;
            Branch   : out STD_LOGIC;
            Jump     : out STD_LOGIC;
            MemtoReg : out STD_LOGIC
        );
    end component;

    -- Signals to connect to the UUT
    signal opcode   : STD_LOGIC_VECTOR (2 downto 0);
    signal RegWrite : STD_LOGIC;
    signal ALUSrc   : STD_LOGIC;
    signal ALUOp    : STD_LOGIC_VECTOR (1 downto 0);
    signal MemRead  : STD_LOGIC;
    signal MemWrite : STD_LOGIC;
    signal Branch   : STD_LOGIC;
    signal Jump     : STD_LOGIC;
    signal MemtoReg : STD_LOGIC;

begin
    -- Instantiate the UUT
    UUT: Control_Unit
        port map (
            opcode   => opcode,
            RegWrite => RegWrite,
            ALUSrc   => ALUSrc,
            ALUOp    => ALUOp,
            MemRead  => MemRead,
            MemWrite => MemWrite,
            Branch   => Branch,
            Jump     => Jump,
            MemtoReg => MemtoReg
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test each opcode
        opcode <= "000"; wait for 10 ns;  -- ADD
        opcode <= "001"; wait for 10 ns;  -- SUB
        opcode <= "010"; wait for 10 ns;  -- LW
        opcode <= "011"; wait for 10 ns;  -- SW
        opcode <= "100"; wait for 10 ns;  -- BEQ
        opcode <= "101"; wait for 10 ns;  -- JUMP
        opcode <= "110"; wait for 10 ns;  -- Unused opcode
        opcode <= "111"; wait for 10 ns;  -- Unused opcode

        -- End simulation
        wait;
    end process;
end Behavioral;
