# ULA (Unidade Lógica e Aritmética) - VHDL

## 🔍 Descrição

A ULA (Unidade Lógica e Aritmética) é um componente fundamental do processador, responsável por realizar operações lógicas e aritméticas. Esta implementação foi desenvolvida em **VHDL** utilizando a plataforma **Quartus**, com suporte a diversas operações e sinais de controle.

A ULA recebe dois operandos de 8 bits (A e B) e um seletor de operação, retornando o resultado da operação escolhida. Também fornece sinalizações importantes como **carry-out**, **overflow** e **zero**.

---

## 🖥️ Componentes e Funcionalidade

### 🔹 **Entradas**

- **A [7:0]** - Operando de 8 bits.
- **B [7:0]** - Operando de 8 bits.
- **Op [3:0]** - Código de operação para selecionar a função a ser executada.

### 🔹 **Saídas**

- **R [7:0]** - Resultado da operação.
- **Cout** - Sinal de carry-out (transporte).
- **Z** - Indicador de zero (1 se R = 0).
- **OVF** - Indicador de overflow (para soma e subtração).

---

## ⚙️ Implementação

A ULA foi implementada em **VHDL**, organizando suas operações da seguinte maneira:

1. **Operações Lógicas**

   - `AND` (A & B)
   - `OR` (A | B)
   - `NOT A` (~A)
   - `NOT B` (~B)
   - `NAND` (~(A & B))
   - `XOR` (A ⊕ B)

2. **Operações Aritméticas**
   - Soma (A + B)
   - Subtração (A - B) usando complemento de dois

A seleção da operação é feita com base no código de controle **Op[3:0]**, utilizando um **multiplexador** interno para direcionar a saída correta.

---

## 🛠️ Ferramentas Utilizadas

- **Quartus** - Desenvolvimento e simulação.
- **ModelSim** - Simulação e depuração do código VHDL.
- **Waveform** - Análise gráfica dos sinais e testes.

---

## 🔬 Testes e Waveforms

Os testes foram realizados no **Quartus** e **ModelSim**, utilizando simulação com **waveforms** para validar cada operação.

### 📌 Exemplo de Testes:

| Op[3:0] | Operação          | Entrada (A, B)     | Saída (R)          | Cout     | Z   | OVF |
| ------- | ----------------- | ------------------ | ------------------ | -------- | --- | --- | --- |
| 0000    | AND (A & B)       | 11001100, 10101010 | 10001000           | -        | 0   | -   |
| 0001    | OR (A             | B)                 | 11001100, 10101010 | 11101110 | -   | 0   | -   |
| 1000    | Soma (A + B)      | 11001100, 10101010 | 01110110           | 1        | 0   | 0   |
| 1001    | Subtração (A - B) | 11001100, 10101010 | 00000010           | 0        | 0   | 0   |

### 📊 **Imagens das Simulações**

Aqui você pode observar as **waveforms** geradas no Quartus:

![Waveform da ALU](../img/waveform_alu.png)

---

## 📂 Arquivos Relacionados

- [Pasta ALU](../src/ALU)
