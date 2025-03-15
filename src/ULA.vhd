

-- criação ula


-- Bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;



-- Entidade
entity ULA is
    port (
        A, B      : in std_logic_vector(7 downto 0); -- Agora são 8 bits
        O         : out std_logic_vector(7 downto 0);
        selection : in std_logic_vector(2 downto 0)
    );
end ULA;

-- Arquitetura
architecture hardware of ULA is
begin
    process (A, B, selection)
    begin
        case selection is
            when "000" => O <= A + B;   -- Soma
            when "001" => O <= A - B;   -- Subtração
            when "010" => O <= A and B; -- AND bit a bit
            when "011" => O <= A or B;  -- OR bit a bit
            when "100" => O <= A xor B; -- XOR bit a bit  
            when "101" => O <= not A;   -- NOT A
            when "110" => O <= not B;   -- NOT B
				when others => O <= (others => '0'); -- valores inválidos
        end case;
    end process;
end hardware;
