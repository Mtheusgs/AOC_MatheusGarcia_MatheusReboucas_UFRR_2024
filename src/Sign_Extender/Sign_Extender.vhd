library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Sign_Extender is
    Port (
        short_address : in std_logic_vector(4 downto 0); -- 5-bit address
        extended_address : out std_logic_vector(7 downto 0) -- 8-bit output
    );
end Sign_Extender;

architecture Behavioral of Sign_Extender is
begin
    -- Zero extension: Prepend three 0s to the 5-bit input
    extended_address <= "000" & short_address;  
end Behavioral;