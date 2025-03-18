library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Datapath_TB is
end Datapath_TB;

architecture Behavioral of Datapath_TB is
    
    -- Component Declaration
    component Datapath
        Port (
            clk                      : in std_logic;
            rst                      : in std_logic;
            PC_out_Port              : out std_logic_vector(7 downto 0); --STORE
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
            RegWrite_Internal_Port   : out std_logic; -- LOAD
            MemRead_Internal_Port    : out std_logic; -- LOAD
            MemWrite_Internal_Port   : out std_logic; -- STORE
            MemtoReg_Internal_Port   : out std_logic; --LOAD, STORE
            ReadData_Memory_Port     : out std_logic_vector(7 downto 0); --LOAD, STORE
            WriteData_Reg_Port       : out std_logic_vector(7 downto 0) --LOAD, STORE
        );
    end component;

    -- Signals
    signal clk   : std_logic := '0';
    signal rst   : std_logic := '0';
    signal PC_out_Port : std_logic_vector(7 downto 0); --STORE
    signal Inst_Port : std_logic_vector(7 downto 0);
    signal Ext_Addr_Port : std_logic_vector(7 downto 0);
    signal Ext_Imm_Port : std_logic_vector(7 downto 0);
    signal Jump_Internal_Port : std_logic;
    signal Branch_Internal_Port : std_logic;
    signal ALUSrc_Internal_Port : std_logic;
    signal ALU_InputB_Port : std_logic_vector(7 downto 0);
    signal RegB_Port : std_logic_vector(7 downto 0); -- STORE
    signal RegA_Port : std_logic_vector(7 downto 0); --LOAD
    signal ALU_Result_Internal_Port : std_logic_vector(7 downto 0); --LOAD,STORE
    signal Zero_Internal_Port : std_logic;
    signal ALUOp_Internal_Port : std_logic_vector(1 downto 0);
    signal RegWrite_Internal_Port : std_logic; --LOAD
    signal MemRead_Internal_Port : std_logic; --LOAD
    signal MemWrite_Internal_Port : std_logic; --STORE
    signal MemtoReg_Internal_Port : std_logic; --LOAD, STORE
    signal ReadData_Memory_Port : std_logic_vector(7 downto 0); --LOAD, STORE
    signal WriteData_Reg_Port : std_logic_vector(7 downto 0); --LOAD, STORE

    -- Clock process (50MHz simulation)
    constant clk_period : time := 20 ns;
    
    begin
    -- Instantiate the Datapath
    DUT: Datapath
        port map (
            clk                      => clk,
            rst                      => rst,
            PC_out_Port              => PC_out_Port, --STORE
            Inst_Port                => Inst_Port,
            Ext_Addr_Port            => Ext_Addr_Port,
            Ext_Imm_Port             => Ext_Imm_Port,
            Jump_Internal_Port       => Jump_Internal_Port,
            Branch_Internal_Port     => Branch_Internal_Port,
            ALUSrc_Internal_Port     => ALUSrc_Internal_Port,
            ALU_InputB_Port          => ALU_InputB_Port,
            RegB_Port                => RegB_Port, --STORE
            RegA_Port                => RegA_Port, -- LOAD
            ALU_Result_Internal_Port => ALU_Result_Internal_Port,  --LOAD, STORE
            Zero_Internal_Port       => Zero_Internal_Port,
            ALUOp_Internal_Port      => ALUOp_Internal_Port,
            RegWrite_Internal_Port   => RegWrite_Internal_Port, --LOAD
            MemRead_Internal_Port    => MemRead_Internal_Port, --LOAD
            MemWrite_Internal_Port   => MemWrite_Internal_Port, --STORE
            MemtoReg_Internal_Port   => MemtoReg_Internal_Port, --LOAD, STORE
            ReadData_Memory_Port     => ReadData_Memory_Port, --LOAD, STORE
            WriteData_Reg_Port       => WriteData_Reg_Port --LOAD, STORE
        );

    -- Clock process
    clk_process : process
    begin
        while now < 1000 ns loop -- Run for a limited time
            clk <= '0';
            wait for clk_period/2;
            clk <= '1';
            wait for clk_period/2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    stimulus : process
    begin
        -- Reset the datapath
        rst <= '1';
        wait for 50 ns;
        rst <= '0';
        
        -- Let the simulation run for some cycles
        wait for 500 ns;
        
        -- Finish simulation
        wait;
    end process;
end Behavioral;
