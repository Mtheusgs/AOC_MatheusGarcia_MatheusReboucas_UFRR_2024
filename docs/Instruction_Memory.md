# Instruction Memory - VHDL

### 🔍 Descrição  
A **Instruction Memory** (Memória de Instruções) é um dos principais componentes do processador, responsável por armazenar as instruções do programa e fornecê-las ao processador com base no valor do **Program Counter (PC)**.  

Nesta implementação, a memória é modelada como uma ROM (Read-Only Memory) contendo um conjunto fixo de instruções, acessadas sequencialmente ou conforme o fluxo de execução do programa.  

---

## 🏗️ Funcionamento  

A memória recebe um endereço de entrada (**PC**) e retorna a instrução armazenada nesse local.  

### 🔹 **Entradas**  
- **PC [7:0]** → Endereço da instrução a ser buscada.  

### 🔹 **Saídas**  
- **Instrucao [15:0]** → Instrução correspondente ao endereço fornecido.  

Essa abordagem permite que o processador obtenha instruções para execução sem necessidade de leitura/escrita dinâmica, garantindo rapidez no acesso aos dados.  

---

## ⚙️ Implementação  

A **Instruction Memory** foi implementada como uma ROM, definida como um array de valores constantes.  

### 🔧 **Código VHDL (Exemplo de Implementação)**  

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity InstructionMemory is
    Port (
        PC : in std_logic_vector(7 downto 0);
        Instrucao : out std_logic_vector(15 downto 0)
    );
end InstructionMemory;

architecture Behavioral of InstructionMemory is
    type ROM_Type is array (0 to 255) of std_logic_vector(15 downto 0);
    signal ROM : ROM_Type := (
        X"2001", -- Instrução 1
        X"3002", -- Instrução 2
        X"4003", -- Instrução 3
        -- Adicione mais instruções conforme necessário
    );

begin
    Instrucao <= ROM(to_integer(unsigned(PC)));
end Behavioral;
```

## 🛠️ Ferramentas Utilizadas  

- **Quartus** → Desenvolvimento do código VHDL e compilação do projeto.  
- **ModelSim** → Simulação funcional e depuração do circuito.  
- **Waveform** → Análise dos sinais e verificações do comportamento da memória.  

---
## 📌 **Metodologia de Testes**  

1. **Configuração do Testbench:**  
   - Criamos um testbench VHDL para fornecer diferentes valores de **PC** e monitorar a saída **Instrucao**.  

2. **Execução no ModelSim:**  
   - Rodamos a simulação para verificar se cada endereço retorna a instrução correta.  

3. **Análise da Waveform:**  
   - Geramos a **waveform** para validar visualmente os sinais.  

---

## 📊 **Tabela de Testes**  

| PC (Endereço) | Instrução Esperada | Instrução Obtida | Status |
|--------------|-------------------|-----------------|--------|
| 00000000 (0) | 2001              | 2001           | ✅ Passou |
| 00000001 (1) | 3002              | 3002           | ✅ Passou |
| 00000010 (2) | 4003              | 4003           | ✅ Passou |

Caso algum valor obtido não corresponda ao esperado, o código da **ROM** deve ser revisado para corrigir eventuais erros.  

---

## 📷 **Imagens das Simulações**  




---

## 📂 Arquivos Relacionados

- [Pasta Instrução da memória](../src/Instruction_Memory)
