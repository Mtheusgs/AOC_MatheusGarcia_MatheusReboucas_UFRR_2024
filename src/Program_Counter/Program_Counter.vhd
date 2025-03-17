library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Program_Counter is
    Port (
        clk         : in std_logic;
        rst         : in std_logic;
        Branch      : in std_logic;
        Zero        : in std_logic;
        Jump        : in std_logic;
        PC_offset   : in std_logic_vector(7 downto 0); 
        Jump_addr   : in std_logic_vector(7 downto 0); 
        PC_out      : out std_logic_vector(7 downto 0) 
    );
end Program_Counter;

architecture Behavioral of Program_Counter is
    signal PC_reg : std_logic_vector(7 downto 0) := (others => '0');
    signal PC_next : std_logic_vector(7 downto 0);
    signal BranchTaken : std_logic;
begin
    BranchTaken <= Branch AND Zero;

    process (clk, rst)
    begin
        if rst = '1' then
            PC_reg <= (others => '0'); -- Reset PC to 0x00
        elsif rising_edge(clk) then
            PC_reg <= PC_next; -- Update PC
        end if;
    end process;

    process (PC_reg, BranchTaken, Jump, PC_offset, Jump_addr)
    begin
        if Jump = '1' then
            PC_next <= Jump_addr;  -- Highest priority: Jump
        elsif BranchTaken = '1' then
            PC_next <= PC_reg + PC_offset;  -- Second priority: Branch
        else
            PC_next <= PC_reg + 1; -- Normal execution
        end if;
    end process;

    PC_out <= PC_reg; -- Send PC value to ROM (Instruction Memory)
end Behavioral;

