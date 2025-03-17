# Extensor de Sinal 2 - VHDL

## 🔍 Descrição
O **Extensor de Sinal 2** é uma versão do **Sign Extender** que expande um valor de 8 bits para um tamanho maior, mas com um comportamento ligeiramente diferente. Ele pode ser configurado para estender o valor para 16 ou 32 bits, dependendo do sinal de controle. A principal diferença do **Sign Extender 2** é a forma como ele manipula o valor de entrada em termos de deslocamento de bits, oferecendo mais flexibilidade. A implementação foi realizada em **VHDL** utilizando a plataforma **Quartus**.

---

## 🖥️ Componentes e Funcionalidade

### 🔹 **Entradas**
- **In [7:0]** - Valor de entrada de 8 bits a ser estendido (valores com sinal).
- **ExtendType** - Sinal de controle que determina o tipo de extensão (16 ou 32 bits).
  - **ExtendType = 0**: Expansão para 16 bits.
  - **ExtendType = 1**: Expansão para 32 bits.

### 🔹 **Saídas**
- **Out [15:0]** - Valor de 16 bits resultante da extensão com sinal.
- **Out [31:0]** - Valor de 32 bits resultante da extensão com sinal.

---

## ⚙️ Implementação
O **Sign Extender 2** é implementado da seguinte forma em **VHDL**:

1. **Expansão de Sinal de 8 para 16 Bits:**
   - Se o bit mais significativo de **In** (bit 7) for 0, o valor é preenchido com zeros à esquerda.
   - Se o bit mais significativo de **In** (bit 7) for 1, o valor é preenchido com uns à esquerda.

2. **Expansão de Sinal de 8 para 32 Bits:**
   - A expansão de sinal é realizada com base no bit mais significativo de **In**, e os 24 bits adicionais são preenchidos com o valor do bit 7.

---

## 🛠️ Ferramentas Utilizadas
- **Quartus** - Desenvolvimento e simulação.
- **ModelSim** - Simulação e depuração do código VHDL.
- **Waveform** - Análise gráfica dos sinais e testes.

---

## 🔬 Testes e Waveforms

Os testes foram realizados no **Quartus** e **ModelSim**, utilizando simulação com **waveforms** para validar o funcionamento do **Sign Extender 2**.

### 📌 Exemplo de Testes:
| Sinal          | Descrição                | Entrada (In) | Saída (Out 16 bits) | Saída (Out 32 bits) |
|----------------|--------------------------|--------------|---------------------|---------------------|
| ExtendType = 0 | Extensão para 16 bits     | 00011100     | 0000000011100000    | 000000000000000000000000111100 |
| ExtendType = 1 | Extensão para 32 bits     | 11111111     | 1111111111111111    | 11111111111111111111111111111111 |

### 📊 **Imagens das Simulações**
Aqui você pode adicionar capturas das **waveforms** geradas no Quartus:

 

---

## 📂 Arquivos Relacionados

- [Pasta Sign_Extender_2](../src/Sign_Extender_2)
