# 🏗️ Datapath - VHDL

## 🔍 Descrição

O **Datapath** é uma parte crucial do processador, responsável por executar operações aritméticas, lógicas e de controle de fluxo, conectando os principais componentes internos. Esta implementação foi desenvolvida em **VHDL** utilizando a plataforma **Quartus**, com suporte à simulação no **ModelSim**.

O Datapath integra componentes como o **Program Counter (PC)**, **Instruction Memory**, **Control Unit**, **Register File**, **ALU** e **Data Memory**, permitindo a execução de instruções de carga, armazenamento, salto condicional e operações aritméticas.

---

## 🖥️ Componentes e Funcionalidade

### 🔹 **Entradas**

- **clk** - Clock do sistema.
- **rst** - Sinal de reset para reinicializar o PC.

### 🔹 **Saídas**

- **PC_out_Port [7:0]** - Saída do contador de programa (PC).
- **Inst_Port [7:0]** - Instrução recuperada da memória de instruções.
- **Ext_Addr_Port [7:0]** - Endereço estendido para instruções de salto.
- **Ext_Imm_Port [7:0]** - Imediato estendido para instruções do tipo imediato.
- **Jump_Internal_Port** - Sinal interno para instruções de salto.
- **Branch_Internal_Port** - Sinal interno para instruções de desvio condicional.
- **ALUSrc_Internal_Port** - Seleção de entrada para a ALU.
- **ALU_InputB_Port [7:0]** - Entrada B da ALU.
- **RegB_Port [7:0]** - Valor lido do registrador B.
- **RegA_Port [7:0]** - Valor lido do registrador A.
- **ALU_Result_Internal_Port [7:0]** - Resultado da ALU.
- **Zero_Internal_Port** - Flag de Zero da ALU.
- **ALUOp_Internal_Port [1:0]** - Código de operação da ALU.
- **RegWrite_Internal_Port** - Controle de escrita no banco de registradores.
- **MemRead_Internal_Port** - Controle de leitura da memória de dados.
- **MemWrite_Internal_Port** - Controle de escrita na memória de dados.
- **MemtoReg_Internal_Port** - Controle de seleção entre ALU e Memória para escrita no registrador.
- **ReadData_Memory_Port [7:0]** - Dados lidos da memória.
- **WriteData_Reg_Port [7:0]** - Dados escritos no banco de registradores.

---

## ⚙️ Implementação

O Datapath foi implementado integrando os seguintes componentes:

1. **Program Counter (PC):** Controla o fluxo das instruções, atualizando o endereço com base em saltos, branches e incrementos.
2. **Instruction Memory:** Armazena as instruções do programa, acessadas pelo valor do PC.
3. **Control Unit:** Gera sinais de controle com base no opcode da instrução.
4. **Sign Extender:** Extende valores imediatos para 8 bits.
5. **Register File:** Armazena valores em registradores e fornece os operandos para a ALU.
6. **ALU:** Executa operações aritméticas e lógicas com base no sinal de controle ALUOp.
7. **Data Memory:** Armazena e recupera dados da memória durante operações de Load/Store.
8. **Multiplexadores:** Selecionam as entradas da ALU e os dados escritos no banco de registradores.

A atualização do PC ocorre com base em saltos e branches, considerando o sinal **Zero** da ALU. O valor escrito no banco de registradores pode vir diretamente do resultado da ALU ou da memória, controlado pelo sinal **MemtoReg**.

---

## 🛠️ Ferramentas Utilizadas

- **Quartus** - Desenvolvimento e simulação do código VHDL.
- **ModelSim** - Simulação e verificação do funcionamento do datapath.
- **Waveform** - Análise gráfica dos sinais e resultados das operações.

---

## 🔬 Testes e Waveforms

Os testes foram realizados no **ModelSim**, verificando cada etapa do ciclo de execução de instruções. O comportamento do Datapath foi validado parcialmente com instruções de diferentes tipos, como R-Type, I-Type e J-Type.

### 📌 Exemplo de Testes:

| Instrução    | PC  | Opcode | RegA | RegB | ALU Result | MemRead | MemWrite | Zero | Observação                   |
| ------------ | --- | ------ | ---- | ---- | ---------- | ------- | -------- | ---- | ---------------------------- |
| `ADD R1, R2` | 04  | 000    | 5    | 3    | 8          | 0       | 0        | 0    | Soma dos valores R1 e R2     |
| `SUB R3, R1` | 08  | 001    | 8    | 5    | 3          | 0       | 0        | 0    | Subtração R1 - R2            |
| `LOAD R1`    | 0C  | 010    | -    | -    | 12         | 1       | 0        | -    | Carrega valor da memória     |
| `STORE R2`   | 10  | 011    | -    | -    | 3          | 0       | 1        | -    | Armazena valor na memória    |
| `BEQ R1, R2` | 14  | 100    | 8    | 8    | -          | 0       | 0        | 1    | Salta se R1 == R2            |
| `JUMP`       | 18  | 101    | -    | -    | -          | 0       | 0        | -    | Salta para endereço imediato |

### 📊 **Imagens das Simulações **

Inclua aqui capturas das **waveforms** geradas no ModelSim para visualização do comportamento dos sinais durante a execução das instruções.

---

## 📂 Arquivos Relacionados

- [Código VHDL do Datapath](../src/Datapath/Datapath.vhd)
- [Testbench do Datapath](../src/Datapath/Datapath_tb.vhd)

---

## 📌 Conclusão

O Datapath implementado não cumpriu com todas funcionalidades esperadas, integrando os principais componentes do processador de forma eficiente. As simulações no ModelSim validaram o comportamento do circuito, garantindo a execução das instruções. 🚀
