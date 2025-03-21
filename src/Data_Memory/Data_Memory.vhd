library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Data_Memory is
    port (
        Clock : in std_logic;
        Address : in std_logic_vector(7 downto 0);
        WriteData : in std_logic_vector(7 downto 0);
        MemRead, MemWrite : in std_logic;
        ReadData : out std_logic_vector(7 downto 0)
    );
end Data_Memory;

architecture Behavioral of Data_Memory is
    type mem_array is array (0 to 15) of std_logic_vector(7 downto 0);
    signal RAM : mem_array := (others => "00000000");
begin
    process (Clock)
    begin
        if rising_edge(Clock) then
            if MemWrite = '1' and to_integer(unsigned(Address)) < 16 then
                RAM(to_integer(unsigned(Address))) <= WriteData;
            end if;
        end if;
    end process;

    ReadData <= RAM(to_integer(unsigned(Address))) when (MemRead = '1' and to_integer(unsigned(Address)) < 16) else (others => '0');
end Behavioral;
