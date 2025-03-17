library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
    Port ( 
        A      : in  STD_LOGIC_VECTOR (7 downto 0); 
        B      : in  STD_LOGIC_VECTOR (7 downto 0); 
        ALUOp  : in  STD_LOGIC_VECTOR (1 downto 0);
        Result : out STD_LOGIC_VECTOR (7 downto 0); 
        Zero   : out STD_LOGIC -- Zero flag for BEQ
    );
end ALU;

architecture Behavioral of ALU is
    signal temp_result : STD_LOGIC_VECTOR(7 downto 0) := (others => '0'); -- Initialize
begin
    operation: process(A, B, ALUOp)
    begin
        case ALUOp is
            when "00" =>  -- ADD
                temp_result <= A + B;

            when "01" =>  -- SUB (A - B)
                temp_result <= A - B;

            when "10" =>  -- AND
                temp_result <= A AND B;

            when "11" =>  -- OR
                temp_result <= A OR B;

            when others =>
                temp_result <= (others => '0'); -- Default case
        end case;
    end process operation;

    -- Assign final result
    Result <= std_logic_vector(temp_result);
    
    process (temp_result)
    begin
        -- Correct Zero flag computation
        if temp_result = 0 then
            Zero <= '1';
        else
            Zero <= '0';
        end if;
    end process;
end Behavioral;

