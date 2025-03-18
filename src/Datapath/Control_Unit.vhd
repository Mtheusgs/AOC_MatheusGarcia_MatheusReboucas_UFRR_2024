library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Control_Unit is
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
end Control_Unit;

architecture Behavioral of Control_Unit is
begin
    process(opcode)
    begin
        case opcode is
            when "000" =>  -- ADD
                RegWrite <= '1';
                ALUSrc   <= '0';
                ALUOp    <= "00";
                MemRead  <= '0';
                MemWrite <= '0';
                BranchFlag   <= '0';
                JumpFlag     <= '0';
                MemtoReg <= '0';
                report "Operation: ADD, RegWrite=1, ALUSrc=0" severity note;

            when "001" =>  -- SUB
                RegWrite <= '1';
                ALUSrc   <= '0';
                ALUOp    <= "01";
                MemRead  <= '0';
                MemWrite <= '0';
                BranchFlag   <= '0';
                JumpFlag     <= '0';
                MemtoReg <= '0';
                report "Operation: SUB, RegWrite=1, ALUSrc=0" severity note;

            when "010" =>  -- LW
                RegWrite <= '1';
                ALUSrc   <= '1';
                ALUOp    <= "00";
                MemRead  <= '1';
                MemWrite <= '0';
                BranchFlag   <= '0';
                JumpFlag     <= '0';
                MemtoReg <= '1';
                report "Operation: LW, RegWrite=1, ALUSrc=1, MemRead=1, MemtoReg=1" severity note;

            when "011" =>  -- SW
                RegWrite <= '0';
                ALUSrc   <= '1';
                ALUOp    <= "00";
                MemRead  <= '0';
                MemWrite <= '1';
                BranchFlag   <= '0';
                JumpFlag     <= '0';
                MemtoReg <= '0';
                report "Operation: SW, ALUSrc=1, MemWrite=1" severity note;

            when "100" =>  -- BEQ
                RegWrite <= '0';
                ALUSrc   <= '0';
                ALUOp    <= "01";
                MemRead  <= '0';
                MemWrite <= '0';
                BranchFlag   <= '1';
                JumpFlag     <= '0';
                MemtoReg <= '0';
                report "Operation: BEQ, ALUOp=01, BranchFlag=1" severity note;

            when "101" =>  -- JUMP
                RegWrite <= '0';
                ALUSrc   <= '0';
                ALUOp    <= "00";  -- Not used
                MemRead  <= '0';
                MemWrite <= '0';
                BranchFlag   <= '0';
                JumpFlag     <= '1';
                MemtoReg <= '0';
                report "Operation: JUMP, JumpFlag=1" severity note;

            when "110" =>  -- ADDI
                RegWrite <= '1';
                ALUSrc   <= '1';
                ALUOp    <= "00";
                MemRead  <= '0';
                MemWrite <= '0';
                BranchFlag   <= '0';
                JumpFlag     <= '0';
                MemtoReg <= '0';
                report "Operation: ADDI, RegWrite=1, ALUSrc=1" severity note;

            when others =>
                RegWrite <= '0';
                ALUSrc   <= '0';
                ALUOp    <= "00";
                MemRead  <= '0';
                MemWrite <= '0';
                BranchFlag   <= '0';
                JumpFlag     <= '0';
                MemtoReg <= '0';
                report "Operation: UNKNOWN" severity note;
        end case;
    end process;
end Behavioral;
