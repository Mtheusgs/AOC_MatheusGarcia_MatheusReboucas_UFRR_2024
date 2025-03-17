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
        Branch   : out STD_LOGIC;
        Jump     : out STD_LOGIC;
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
                Branch   <= '0';
                Jump     <= '0';
                MemtoReg <= '0';

            when "001" =>  -- SUB
                RegWrite <= '1';
                ALUSrc   <= '0';
                ALUOp    <= "01";
                MemRead  <= '0';
                MemWrite <= '0';
                Branch   <= '0';
                Jump     <= '0';
                MemtoReg <= '0';

            when "010" =>  -- LW
                RegWrite <= '1';
                ALUSrc   <= '1';
                ALUOp    <= "00";
                MemRead  <= '1';
                MemWrite <= '0';
                Branch   <= '0';
                Jump     <= '0';
                MemtoReg <= '1';

            when "011" =>  -- SW
                RegWrite <= '0';
                ALUSrc   <= '1';
                ALUOp    <= "00";
                MemRead  <= '0';
                MemWrite <= '1';
                Branch   <= '0';
                Jump     <= '0';
                MemtoReg <= '0';

            when "100" =>  -- BEQ
                RegWrite <= '0';
                ALUSrc   <= '0';
                ALUOp    <= "01";
                MemRead  <= '0';
                MemWrite <= '0';
                Branch   <= '1';
                Jump     <= '0';
                MemtoReg <= '0';

            when "101" =>  -- JUMP
                RegWrite <= '0';
                ALUSrc   <= '0';
                ALUOp    <= "00";  -- Not used
                MemRead  <= '0';
                MemWrite <= '0';
                Branch   <= '0';
                Jump     <= '1';
                MemtoReg <= '0';

            when others =>
                RegWrite <= '0';
                ALUSrc   <= '0';
                ALUOp    <= "00";
                MemRead  <= '0';
                MemWrite <= '0';
                Branch   <= '0';
                Jump     <= '0';
                MemtoReg <= '0';
        end case;
    end process;
end Behavioral;
