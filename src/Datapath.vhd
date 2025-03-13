library ieee;
use ieee.std_logic_1164;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Datapath is
	 port (
		  Clock, Reset : in std_logic;
		  Opcode : out std_logic_vector(2 downto 0);
		  Zero : out std_logic
	 );
end Datapath;

architecture Behavioral of Datapath is

	 -- PC
	 signal PC : std_logic_vector(7 downto 0) := (others => '0')
	 
	 -- Instruction Memory (Simplified, 8-bit instruction width)
	 type instr_mem is array (0 to 15) of std_logic_vector(7 downto 0);
	 signal InstructionMemory : instr_mem := (others => "00000000");
	 signal Instruction : std_logic_vector(7 downto 0);
	 
	 -- Register File Signals
	 signal ReadData1, ReadData2, WriteData : std_logic_vector(7 downto 0);
	 signal ReadReg1, ReadReg2, WriteReg : std_logic_vector(1 downto 0);
	 signal RegWrite : std_logic;
	 
	 -- ALU Signals
	 signal ALUResult : std_logic_vector(7 downto 0);
	 signal ALUOp : std_logic_vector(2 downto 0);
	 signal ALUSrc : std_logic;
	 
	 -- Data Memory Signals
	 type data_mem is array (0 to 15) of std_logic_vector(7 downto 0);
	 signal DataMemory : data_mem := (others => "00000000");
	 signal MemRead, MemWrite, MemToReg : std_logic;
	 signal MemData : std_logic_vector(7 downto 0);
	 
	 -- Branch and Jump Signals
	 signal Branch, Jump : std_logic;
	 
	 -- Control Unit Signals
	 signal NextState : std_logic_vector(2 downto 0);
	 
begin

	 -- IF Stage
	 process(Clock, Reset)
	 begin
		  if Reset = '1' then
				PC <= (others => '0');
		  elsif rising_edge(Clock) then
				if Jump = '1' then
					 PC <= Instruction(7 downto 0); -- Jump Address
				elsif (Branch = '1' and Zero = '1') then
					 PC <= PC + Instruction(7 downto 0); -- Branch Offset
				else
					 PC <= PC + 1;
				end if;
			end if;
		end process;
		
		-- Fetch Instruction
		Instruction <= InstructionMemory(to_integer(unsigned(PC)));
		Opcode <= Instruction(7 downto 5);
		ReadReg1 <= Instruction(4 downto 3);
		ReadReg2 <= Instruction(2 downto 1);
		WriteReg <= Instruction(4 downto 3);
		
		-- Instantiate Register File
		 RegFile: entity work.RegisterFile
			  port map (
					Clock => Clock,
					ReadReg1 => ReadReg1,
					ReadReg2 => ReadReg2,
					WriteReg => WriteReg,
					WriteData => WriteData,
					RegWrite => RegWrite,
					ReadData1 => ReadData1,
					ReadData2 => ReadData2
			  );
		 
		 -- ALU Operation
		 ALU: entity work.ALU
			  port map (
					A => ReadData1,
					B => (others => '0') when ALUSrc = '1' else ReadData2,
					Op_Selector => ALUOp,
					Zero => Zero,
					Result => ALUResult
			  );
		 
		 -- Data Memory
		 process(Clock)
		 begin
			  if rising_edge(Clock) then
					if MemWrite = '1' then
						 DataMemory(to_integer(unsigned(ALUResult))) <= ReadData2;
					end if;
			  end if;
		 end process;
		 MemData <= DataMemory(to_integer(unsigned(ALUResult)));
		 
		 -- Write Back (WB) Stage
		 WriteData <= ALUResult when MemToReg = '0' else MemData;
		 
		 -- Control Unit
		 Control: entity work.ControlUnit
			  port map (
					Opcode => Opcode,
					State => NextState,
					RegDst => open,
					ALUSrc => ALUSrc,
					MemRead => MemRead,
					MemWrite => MemWrite,
					MemToReg => MemToReg,
					RegWrite => RegWrite,
					ALUOp => ALUOp,
					Branch => Branch,
					Jump => Jump,
					NextState => NextState
			  );
    
end Behavioral;
					 