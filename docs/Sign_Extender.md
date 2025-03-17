# Extensor de Sinal - VHDL

## 🔍 Descrição
O **Extensor de Sinal** é um componente responsável por expandir um valor de dados de um tamanho menor, como por exemplo (8 bits) para um tamanho maior (como 16 bits ou 32 bits), mantendo o sinal correto. A expansão do sinal é feita replicando o bit de sinal (bit mais significativo) nos bits adicionais. Esta implementação foi realizada em **VHDL** utilizando a plataforma **Quartus**, sendo útil para instruções que exigem valores de imediato maiores que o tamanho de um byte.

---

## 🖥️ Componentes e Funcionalidade

### 🔹 **Entradas**
- **In [7:0]** - Valor de entrada de 8 bits a ser estendido (valores com sinal).
- **SignExtend** - Sinal de controle que determina se o valor será estendido para 16 ou 32 bits.

### 🔹 **Saídas**
- **Out [15:0]** - Valor de 16 bits resultante da extensão com sinal.
- **Out [31:0]** - Valor de 32 bits resultante da extensão com sinal (dependendo do sinal de controle).

---

## ⚙️ Implementação
O **Sign Extender** é implementado da seguinte forma em **VHDL**:

1. **Expansão de Sinal de 8 para 16 Bits:**
   - Se o bit mais significativo de **In** (bit 7) for 0, o valor é preenchido com zeros à esquerda.
   - Se o bit mais significativo de **In** (bit 7) for 1, o valor é preenchido com uns à esquerda.

2. **Expansão de Sinal de 8 para 32 Bits:**
   - Similar à expansão para 16 bits, mas preenchendo os 24 bits adicionais com o bit mais significativo de **In**.

---

## 🛠️ Ferramentas Utilizadas
- **Quartus** - Desenvolvimento e simulação.
- **ModelSim** - Simulação e depuração do código VHDL.
- **Waveform** - Análise gráfica dos sinais e testes.

---

## 🔬 Testes e Waveforms

Os testes foram realizados no **Quartus** e **ModelSim**, utilizando simulação com **waveforms** para validar o funcionamento do **Sign Extender**.

### 📌 Exemplo de Testes:
| Sinal      | Descrição                   | Entrada (In) | Saída (Out 16 bits) | Saída (Out 32 bits) |
|------------|-----------------------------|--------------|---------------------|---------------------|
| SignExtend = 0 | Extensão para 16 bits          | 00001111     | 000000001111        | 00000000000000001111 |
| SignExtend = 1 | Extensão para 32 bits          | 10001111     | 1111111110001111    | 111111111111111100001111 |

### 📊 **Imagens das Simulações**
Aqui você pode adicionar capturas das **waveforms** geradas no Quartus:

 

---

## 📂 Arquivos Relacionados

- [Pasta Sign_Extender](../src/Sign_Extender)
