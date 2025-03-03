library IEEE;
   use IEEE.STD_LOGIC_1164.ALL;
	USE ieee.std_logic_arith.all;
	USE ieee.std_logic_unsigned.all;
	
entity ALU is
    port (
        A, B     : in std_logic_vector(7 downto 0);  
        Op_Selector  : in std_logic_vector(2 downto 0);  
        Zero     : out std_logic;                    
        Result   : out std_logic_vector(7 downto 0) 
    );
end ALU;		

architecture Behavioral of ALU is
begin
    process(A, B, Op_Selector)
    variable temp_result : std_logic_vector(7 downto 0);
    begin
        case Op_Selector is
            when "000" =>  -- ADD
                temp_result := A + B;
            when "001" =>  -- SUB
                temp_result := A - B;
            when "010" =>  -- AND
                temp_result := A and B;
            when "011" =>  -- OR
                temp_result := A or B;
            when "100" =>  -- SLT (Set Less Than)
                if A < B then
                    temp_result := "00000001";
                else
                    temp_result := "00000000";
                end if;
            when others =>  -- Default case (NOP)
                temp_result := (others => '0');
        end case;

        Result <= temp_result;
		  if temp_result = "00000000" then -- Flag for BEQ/BNE
            Zero <= '1';
        else
            Zero <= '0';
        end if;    
	 end process;
end Behavioral;