library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ControlUnit is
	 port (
		  Opcode: in std_logic_vector(2 downto 0); -- 3-bit opcode
		  State: in std_logic_vector(2 downto 0); -- Current Finite State Machine
		  RegDst: out std_logic;
		  ALUSrc: out std_logic;
		  MemRead: out std_logic;
		  MemWrite: out std_logic;
		  MemToReg: out std_logic;
		  RegWrite: out std_logic;
		  ALUOp : out std_logic_vector(2 downto 0);
		  Branch: out std_logic;
		  Jump: out std_logic;
		  NextState: out std_logic_vector(2 downto 0) -- Next Finite State Machine
	 );
end ControlUnit;

architecture Behavioral of ControlUnit is
begin
	  process(Opcode, State)
	  begin
	  -- Default values
			RegDst <= '0';
			ALUSrc <= '0';
			MemRead <= '0';
			MemWrite <= '0';
			MemToReg <= '0';
			RegWrite <= '0';
			ALUOp <= "000";
			Branch <= '0';
			Jump <= '0';
			NextState <= "000";
			
			case State is
            when "000" =>  -- IF
                MemRead  <= '1';
                NextState <= "001";

            when "001" =>  -- ID
                case Opcode is
                    when "000" | "001" | "010" | "011" | "100" => -- R-type & Load
                        NextState <= "010";
                    when "101" => -- Store
                        NextState <= "011";
                    when "110" => -- Branch
                        NextState <= "100";
                    when "111" => -- Jump
                        Jump <= '1';
                        NextState <= "000";
                    when others =>
                        NextState <= "000"; -- Default
                end case;

            when "010" =>  -- EX (R-type, Load)
                ALUSrc  <= '0';
                ALUOp   <= Opcode;  
                if Opcode = "100" then  -- Load
                    MemRead  <= '1';
                    NextState <= "011";
                else  -- R-type
                    RegDst   <= '1';
                    RegWrite <= '1';
                    NextState <= "000";
                end if;

            when "011" =>  -- Memory Access (Load/Store)
                if Opcode = "100" then  -- Load
                    MemToReg <= '1';
                    RegWrite <= '1';
                elsif Opcode = "101" then  -- Store
                    MemWrite <= '1';
                end if;
                NextState <= "000";

            when "100" =>  -- Branch
                ALUOp   <= "101";  
                Branch  <= '1';
                NextState <= "000";

            when others =>
                NextState <= "000";
        end case;
		end process;
end Behavioral; 