library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity DataMemory is
    port (
        Clock : in std_logic;
        Address : in std_logic_vector(7 downto 0);
        WriteData : in std_logic_vector(7 downto 0);
        MemRead, MemWrite : in std_logic;
        ReadData : out std_logic_vector(7 downto 0)
    );
end DataMemory;

architecture Behavioral of DataMemory is
    type mem_array is array (0 to 15) of std_logic_vector(7 downto 0);
    signal RAM : mem_array := (others => "00000000");
begin
    process (Clock)
    begin
        if rising_edge(Clock) then
            if MemWrite = '1' then
                RAM(to_integer(unsigned(Address))) <= WriteData;
            end if;
        end if;
    end process;
    ReadData <= RAM(to_integer(unsigned(Address))) when MemRead = '1' else (others => '0');
end Behavioral;
