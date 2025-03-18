library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Datapath is
    Port (
        clk                      : in std_logic;
        rst                      : in std_logic;
        PC_out_Port              : out std_logic_vector(7 downto 0); -- STORE
        Inst_Port                : out std_logic_vector(7 downto 0);
        Ext_Addr_Port            : out std_logic_vector(7 downto 0);
        Ext_Imm_Port             : out std_logic_vector(7 downto 0);
        Jump_Internal_Port       : out std_logic;
        Branch_Internal_Port     : out std_logic;
        ALUSrc_Internal_Port     : out std_logic;
        ALU_InputB_Port          : out std_logic_vector(7 downto 0);
        RegB_Port                : out std_logic_vector(7 downto 0); --STORE
        RegA_Port                : out std_logic_vector(7 downto 0); --LOAD
        ALU_Result_Internal_Port : out std_logic_vector(7 downto 0); --LOAD, STORE
        Zero_Internal_Port       : out std_logic;
        ALUOp_Internal_Port      : out std_logic_vector(1 downto 0);
        RegWrite_Internal_Port   : out std_logic;  --LOAD
        MemRead_Internal_Port    : out std_logic;  --LOAD
        MemWrite_Internal_Port   : out std_logic; -- STORE
        MemtoReg_Internal_Port   : out std_logic;  --LOAD, STORE
        ReadData_Memory_Port     : out std_logic_vector(7 downto 0);  --LOAD, STORE
        WriteData_Reg_Port       : out std_logic_vector(7 downto 0)  --LOAD, STORE
    );
end Datapath;

architecture Behavioral of Datapath is
    signal PC_out : std_logic_vector(7 downto 0);
    signal Inst  : std_logic_vector(7 downto 0);
    signal Ext_Addr : std_logic_vector(7 downto 0);
    signal Ext_Imm  : std_logic_vector(7 downto 0);
    signal Jump_Internal   : std_logic;
    signal Branch_Internal : std_logic;
    signal ALUSrc_Internal : std_logic;
    signal ALU_InputB      : std_logic_vector(7 downto 0);
    signal RegB            : std_logic_vector(7 downto 0);
    signal RegA            : std_logic_vector(7 downto 0);
    signal ALU_Result_Internal : std_logic_vector(7 downto 0);
    signal Zero_Internal   : std_logic;
    signal ALUOp_Internal  : std_logic_vector(1 downto 0);
    signal RegWrite_Internal : std_logic;
    signal MemRead_Internal : std_logic;
    signal MemWrite_Internal : std_logic;
    signal MemtoReg_Internal : std_logic;
    signal ReadData_Memory  : std_logic_vector(7 downto 0);
    signal WriteData_Reg    : std_logic_vector(7 downto 0);
    constant PC_offset : std_logic_vector(7 downto 0) := "00000100"; -- Constant value 4

    -- Component Declarations
    component Program_Counter
        Port (
            clk       : in std_logic;
            rst       : in std_logic;
            Branch    : in std_logic;
            Zero      : in std_logic;
            Jump      : in std_logic;
            PC_offset : in std_logic_vector(7 downto 0);
            Jump_addr : in std_logic_vector(7 downto 0);
            PC_out    : out std_logic_vector(7 downto 0)
        );
    end component;

    component Instruction_Memory
        Port (
            Address     : in std_logic_vector(7 downto 0);
            Instruction : out std_logic_vector(7 downto 0)
        );
    end component;

    component Sign_Extender
        Port (
            short_address : in std_logic_vector(4 downto 0);
            extended_address : out std_logic_vector(7 downto 0)
        );
    end component;

    component Sign_Extender_2
        Port (
            short_address_2 : in std_logic_vector(2 downto 0);
            extended_address_2 : out std_logic_vector(7 downto 0)
        );
    end component;

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

    component ALU
        Port (
            A         : in  STD_LOGIC_VECTOR (7 downto 0);
            B         : in  STD_LOGIC_VECTOR (7 downto 0);
            ALUOp_In  : in  STD_LOGIC_VECTOR (1 downto 0);
            Result    : out STD_LOGIC_VECTOR (7 downto 0);
            Zero_Flag : out STD_LOGIC
        );
    end component;

    component RegisterFile
        Port (
            Clock      : in std_logic;
            ReadReg1   : in std_logic_vector(1 downto 0);
            ReadReg2   : in std_logic_vector(1 downto 0);
            WriteData  : in std_logic_vector(7 downto 0);
            RegWrite   : in std_logic;
            ReadData1  : out std_logic_vector(7 downto 0);
            ReadData2  : out std_logic_vector(7 downto 0)
        );
    end component;

    component Data_Memory
        Port (
            Clock     : in std_logic;
            Address   : in std_logic_vector(7 downto 0);
            WriteData : in std_logic_vector(7 downto 0);
            MemRead   : in std_logic;
            MemWrite  : in std_logic;
            ReadData  : out std_logic_vector(7 downto 0)
        );
    end component;

begin
    PC_out_Port <= PC_out; --STORE
    Inst_Port <= Inst;
    Ext_Addr_Port <= Ext_Addr;
    Ext_Imm_Port <= Ext_Imm;
    Jump_Internal_Port <= Jump_Internal;
    Branch_Internal_Port <= Branch_Internal;
    ALUSrc_Internal_Port <= ALUSrc_Internal;
    ALU_InputB_Port <= ALU_InputB;     
    RegB_Port <= RegB; --STORE           
    RegA_Port <= RegA; --LOAD 
    ALU_Result_Internal_Port <= ALU_Result_Internal; --LOAD, STORE
    Zero_Internal_Port <= Zero_Internal;   
    ALUOp_Internal_Port <= ALUOp_Internal; 
    RegWrite_Internal_Port <= RegWrite_Internal; --LOAD
    MemRead_Internal_Port <= MemRead_Internal; --LOAD
    MemWrite_Internal_Port <= MemWrite_Internal; --STORE
    MemtoReg_Internal_Port <= MemtoReg_Internal; --LOAD, STORE
    ReadData_Memory_Port <= ReadData_Memory;  --LOAD, STORE
    WriteData_Reg_Port <= WriteData_Reg; --LOAD, STORE
    -- Instantiate Program Counter
    PC: Program_Counter
        port map (
            clk       => clk,
            rst       => rst,
            Branch    => Branch_Internal, -- Connected internally
            Zero      => Zero_Internal, -- Connected internally
            Jump      => Jump_Internal, -- Connected internally
            PC_offset => PC_offset, -- Constant value used
            Jump_addr => Ext_Addr, -- Connect Jump_addr to Extended_Address
            PC_out    => PC_out
        );
    
    -- Instantiate Instruction Memory
    IM: Instruction_Memory
        port map (
            Address     => PC_out,
            Instruction => Inst
        );
    
    -- Instantiate Sign Extenders
    SE1: Sign_Extender
        port map (
            short_address => Inst(4 downto 0),
            extended_address => Ext_Addr
        );
    
    SE2: Sign_Extender_2
        port map (
            short_address_2 => Inst(2 downto 0),
            extended_address_2 => Ext_Imm
        );

    -- Instantiate Control Unit
    CU: Control_Unit
        port map (
            opcode   => Inst(7 downto 5),
            RegWrite => RegWrite_Internal,
            ALUSrc   => ALUSrc_Internal,
            ALUOp    => ALUOp_Internal,
            MemRead  => MemRead_Internal,
            MemWrite => MemWrite_Internal,
            BranchFlag => Branch_Internal,
            JumpFlag   => Jump_Internal,
            MemtoReg => MemtoReg_Internal
        );

    -- Instantiate Data Memory
    DM: Data_Memory
        port map (
            Clock     => clk,
            Address   => ALU_Result_Internal, -- Address from ALU result
            WriteData => RegB, -- Data from register B
            MemRead   => MemRead_Internal,
            MemWrite  => MemWrite_Internal,
            ReadData  => ReadData_Memory
        );

    -- Multiplexer for WriteData selection to RegisterFile
    process(MemtoReg_Internal, ALU_Result_Internal, ReadData_Memory)
    begin
        if MemtoReg_Internal = '1' then
            WriteData_Reg <= ReadData_Memory; -- Load from memory
        else
            WriteData_Reg <= ALU_Result_Internal; -- Result from ALU
        end if;
    end process;

    -- Update RegisterFile to support write-back
    RF: RegisterFile
        port map (
            Clock     => clk,
            ReadReg1  => Inst(4 downto 3),
            ReadReg2  => Inst(2 downto 1),
            RegWrite  => RegWrite_Internal,
            WriteData => WriteData_Reg, -- Write data from ALU or memory
            ReadData1 => RegA,
            ReadData2 => RegB
        );

    -- Multiplexer for ALU input B selection
    process(ALUSrc_Internal, RegB, Ext_Imm)
    begin
        if ALUSrc_Internal = '1' then
            ALU_InputB <= Ext_Imm;  -- Immediate value
        else
            ALU_InputB <= RegB;     -- Register value
        end if;
    end process;

    -- Instantiate ALU
    ALU_Unit: ALU
        port map (
            A         => RegA,  -- ReadData1 from Register File
            B         => ALU_InputB,  -- Selected value (RegB or Imm)
            ALUOp_In  => ALUOp_Internal, -- Internal ALUOp
            Result    => ALU_Result_Internal,
            Zero_Flag => Zero_Internal
        );

end Behavioral;
