-- Bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

-- Testbench (sem portas)
entity ULA_tb is
end ULA_tb;

-- Arquitetura do Testbench
architecture test of ULA_tb is
    -- Declaração dos sinais para conectar à ULA
    signal A, B    : std_logic_vector(7 downto 0) := (others => '0');
    signal O       : std_logic_vector(7 downto 0);
    signal sel     : std_logic_vector(2 downto 0) := "000"; -- Inicia com soma

begin
    -- Instância da ULA
    UUT: entity work.ULA port map (
        A => A,
        B => B,
        O => O,
        selection => sel
    );

    -- Processo de teste
    process
    begin
        -- Teste 1: Soma (000)
        A <= "00000011";  -- 3
        B <= "00000101";  -- 5
        sel <= "000";      -- Operação de soma
        wait for 10 ns;    -- Espera 10 ns

        -- Teste 2: Subtração (001)
        sel <= "001";
        wait for 10 ns;

        -- Teste 3: AND (010)
        sel <= "010";
        wait for 10 ns;

        -- Teste 4: OR (011)
        sel <= "011";
        wait for 10 ns;

        -- Teste 5: XOR (100)
        sel <= "100";
        wait for 10 ns;

        -- Teste 6: NOT A (101)
        sel <= "101";
        wait for 10 ns;

        -- Teste 7: NOT B (110)
        sel <= "110";
        wait for 10 ns;

        -- Fim da simulação
        wait;
    end process;

end test;
