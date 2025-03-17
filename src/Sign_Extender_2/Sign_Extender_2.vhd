library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Sign_Extender_2 is
    Port (
        short_address : in std_logic_vector(2 downto 0); -- 3-bit address
        extended_address : out std_logic_vector(7 downto 0) -- 8-bit output
    );
end Sign_Extender_2;

architecture Behavioral of Sign_Extender_2 is
begin
    -- Zero extension: Prepend five 0s to the 3-bit input
    extended_address <= "00000" & short_address;  
end Behavioral;
