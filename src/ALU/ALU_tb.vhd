library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU_tb is
end ALU_tb;

architecture test of ALU_tb is
    signal A, B, Result : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal ALUOp : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal Zero : STD_LOGIC := '0';

    -- Instantiate ALU
    component ALU
        Port ( 
            A      : in  STD_LOGIC_VECTOR (7 downto 0); 
            B      : in  STD_LOGIC_VECTOR (7 downto 0); 
            ALUOp  : in  STD_LOGIC_VECTOR (1 downto 0);
            Result : out STD_LOGIC_VECTOR (7 downto 0); 
            Zero   : out STD_LOGIC
        );
    end component;

begin
    -- Connect test signals to ALU
    uut: ALU port map (
        A      => A,
        B      => B,
        ALUOp  => ALUOp,
        Result => Result,
        Zero   => Zero
    );

    process
    begin
        -- Test Case 1: ADD (5 + 10)
        A <= "00000101"; -- 5
        B <= "00001010"; -- 10
        ALUOp <= "00";   -- ADD
        wait for 10 ns;

        -- Test Case 2: SUB (10 - 5)
        A <= "00001010"; -- 10
        B <= "00000101"; -- 5
        ALUOp <= "01";   -- SUB
        wait for 10 ns;

        -- Test Case 3: AND (5 AND 3)
        A <= "00000101"; -- 5 (00000101)
        B <= "00000011"; -- 3 (00000011)
        ALUOp <= "10";   -- AND
        wait for 10 ns;

        -- Test Case 4: OR (5 OR 3)
        A <= "00000101"; -- 5 (00000101)
        B <= "00000011"; -- 3 (00000011)
        ALUOp <= "11";   -- OR
        wait for 10 ns;

        -- Test Case 5: SUB (5 - 5) -> Zero flag should be 1
        A <= "00000101"; -- 5
        B <= "00000101"; -- 5
        ALUOp <= "01";   -- SUB
        wait for 10 ns;

        -- Stop simulation
        wait;
    end process;
end test;
