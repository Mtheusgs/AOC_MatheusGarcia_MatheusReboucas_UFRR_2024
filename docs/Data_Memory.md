# Data Memory

### 🔍 Descrição

A **Data Memory** é um componente essencial do processador, responsável por armazenar e recuperar dados durante a execução do programa. Ela suporta operações de **leitura** e **escrita**, controladas por sinais de controle.

Este módulo foi implementado em **VHDL** e testado utilizando **Quartus**, **ModelSim** e **Waveform Analyzer**.

---

## 🛠️ Ferramentas Utilizadas

- **Quartus** → Desenvolvimento do código VHDL e compilação do projeto.
- **ModelSim** → Simulação funcional e verificação da memória.
- **Waveform** → Visualização dos acessos à memória e comportamento dos sinais.

---

## 🔬 **Testes e Validação**

Os testes foram projetados para verificar os seguintes comportamentos da memória:

✅ **Leitura correta** de um endereço previamente armazenado.  
✅ **Escrita correta** de dados na memória.  
✅ **Persistência** dos dados escritos.  
✅ **Validação do sinal de controle** para evitar escrita indevida.

---

## 📌 **Metodologia de Testes**

1. **Configuração do Testbench:**

   - Criamos um testbench em **VHDL** que simula operações de leitura e escrita na memória.

2. **Execução no ModelSim:**

   - Testamos diferentes valores e endereços para verificar o comportamento da memória.

3. **Análise da Waveform:**
   - Observamos os sinais de **clock**, **endereço**, **dados de entrada**, **dados de saída** e **sinal de controle** para validar a funcionalidade.

---

## 📊 **Tabela de Testes**

| Endereço | Dados Escrito | Dados Lido | Operação | Status    |
| -------- | ------------- | ---------- | -------- | --------- |
| 00000000 | 10101010      | 10101010   | Escrita  | ✅ Passou |
| 00000001 | 11001100      | 11001100   | Escrita  | ✅ Passou |
| 00000010 | 00001111      | 00001111   | Leitura  | ✅ Passou |

Caso algum valor obtido não corresponda ao esperado, o código VHDL da memória deve ser revisado para corrigir eventuais erros.

---

### 📊 **Imagens das Simulações**

Aqui você pode observar as **waveforms** geradas no Quartus:

![Waveform da ALU](../img/waveform_datamemory.png)

---

---

## 📂 Arquivos Relacionados

- [Pasta Data_Memory](../src/Data_Memory)
