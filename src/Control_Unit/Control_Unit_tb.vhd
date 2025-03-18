library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Control_Unit_tb is
end Control_Unit_tb;

architecture behavior of Control_Unit_tb is

    -- Component Declaration
    component Control_Unit
        Port (
            opcode   : in  STD_LOGIC_VECTOR (2 downto 0);
            RegWrite : out STD_LOGIC;
            ALUSrc   : out STD_LOGIC;
            ALUOp    : out STD_LOGIC_VECTOR (1 downto 0);
            MemRead  : out STD_LOGIC;
            MemWrite : out STD_LOGIC;
            BranchFlag   : out STD_LOGIC;
            JumpFlag     : out STD_LOGIC;
            MemtoReg : out STD_LOGIC
        );
    end component;

    -- Signals
    signal opcode_tb   : STD_LOGIC_VECTOR (2 downto 0) := "000";
    signal RegWrite_tb, ALUSrc_tb, MemRead_tb, MemWrite_tb, BranchFlag_tb, JumpFlag_tb, MemtoReg_tb : STD_LOGIC;
    signal ALUOp_tb    : STD_LOGIC_VECTOR (1 downto 0);

begin
    -- Instantiate the Control Unit
    uut: Control_Unit
        port map (
            opcode => opcode_tb,
            RegWrite => RegWrite_tb,
            ALUSrc => ALUSrc_tb,
            ALUOp => ALUOp_tb,
            MemRead => MemRead_tb,
            MemWrite => MemWrite_tb,
            BranchFlag => BranchFlag_tb,
            JumpFlag => JumpFlag_tb,
            MemtoReg => MemtoReg_tb
        );

    -- Stimulus Process
    stim_proc: process
    begin
        -- Test all opcodes
        for i in 0 to 6 loop
            opcode_tb <= std_logic_vector(to_unsigned(i, 3));
            wait for 10 ns;
        end loop;
        
        -- Test invalid opcode
        opcode_tb <= "111";
        wait for 10 ns;

        wait;
    end process;

end behavior;