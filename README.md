![Image](https://github.com/user-attachments/assets/8004c028-5c42-4a70-b100-4b7b6045c4a5)

# Projeto Final: Processador 8 bits

## 📚 Disciplina: Arquitetura e Organização de Computadores

### 🎯 Objetivo

Este repositório foi criado para documentar detalhadamente o desenvolvimento de um processador de 8 bits, projeto final da disciplina de Arquitetura e Organização de Computadores. Além de fornecer um relatório completo, ele também serve como um recurso para estudantes e entusiastas da área, oferecendo suporte para dúvidas e dificuldades relacionadas ao projeto.

---

### 🏗️ Descrição do Projeto

Este projeto consiste no desenvolvimento de um processador de 8 bits utilizando a ferramenta Quartus. Durante o processo, foram criados diversos componentes essenciais para a arquitetura do processador, bem como seu datapath. Para validar o funcionamento do circuito, foram utilizados os simuladores Waveform e ModelSim para realizar testes e depuração.

---

### Diagrama do Processador Envisionado

![Diagrama MIPS 8 Bits com 4 Registradores](/img/diagrama_do_processador.png)

---

### 📌 Estrutura das Instruções

- Tipo R: **opcode (3 bits) | Reg1 (2 bits) | Reg2 (2 bits) | (desconsiderado, 1 bit)**;
- Tipo I: **opcode (3 bits) | Reg (2 bits) | Immediato (3 bits)**;
- Tipo J: **opcode (3 bits) | Address (5 bits)**.

---

### 📂 Estrutura do Repositório

- **[/src](./src)**: Contém os arquivos-fonte do projeto, incluindo a implementação dos componentes do processador.
- **[/docs](./docs)**: Inclui documentações, diagramas e relatórios técnicos sobre o desenvolvimento.
- **[/img](./img/)**: Inclui as imagens utilizadas na documentação e README.
- **README.md**: Este documento.

---

### 🛠️ Ferramentas Utilizadas

- **Quartus**: Utilizado para a implementação do processador e a criação dos componentes.
- **ModelSim**: Ferramenta utilizada para simulação e depuração do circuito.
- **Waveform**: Usado para análise do comportamento do processador por meio de formas de onda.

---

### 📖 Como Usar Este Repositório

1. Clone o repositório:
   ```bash
   git clone  https://https://github.com/Mtheusgs/AOC_MatheusGarcia_MatheusReboucas_UFRR_2024.git
   cd AOC_MatheusGarcia_MatheusReboucas_UFRR_2024
   ```
2. Abra o projeto no Quartus.
3. Execute as simulações utilizando o ModelSim e o Waveform.
4. Consulte os documentos na pasta `/docs` para mais informações sobre o funcionamento do processador.
5. Em caso de dúvida sobre como rodar o testbench junto com a entidade principal, verifique o vídeo [aqui](https://www.youtube.com/watch?v=NbuOL0FVw80&list=PLYE3wKnWQbHDdnb3FsDkNx2tj8xoQAPtN&index=24)

---

### 📢 Contribuições

Sinta-se à vontade para contribuir com sugestões, correções e melhorias para este projeto. Caso tenha dúvidas, abra uma issue ou entre em contato!

🚀 **Vamos construir conhecimento juntos!**
