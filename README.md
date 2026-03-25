# 🦷 Trabalho DB: Sistema de Gestão para Clínica Odontológica

Este repositório contém o projeto de modelagem e implementação de um banco de dados relacional para a gestão integral de uma clínica odontológica, abrangendo desde o cadastro de pacientes até o controle de agendamentos e procedimentos.

## 📌 Contextualização do Cenário

Este sistema foi projetado para modernizar a operação de clínicas odontológicas de médio porte que buscam centralizar o fluxo de atendimento. A modelagem permite que a recepção gerencie agendas complexas de múltiplos dentistas, mantenha um histórico detalhado de prontuários dos pacientes e vincule procedimentos específicos a cada consulta, garantindo a integridade dos dados e a agilidade no acesso às informações clínicas sem a necessidade de prontuários físicos.

## 🛠️ Requisitos do Projeto

- **Funcionais:**
  Gestão de Pacientes: Cadastro completo, incluindo CPF e histórico.
  Controle de Dentistas: Registro profissional (CRO), especialidades e horários de atendimento.
  Agendamentos: Registro, atualização e cancelamento de consultas.
  Procedimentos: Catálogo de serviços oferecidos com descrição e duração.

Vínculos: Associação de múltiplos procedimentos a uma única consulta.

- **Interatividade:** Fluxos de Entrada e Saída (`leia`/`escreva`) para comunicação com o usuário.
- **Controle de Fluxo:** Uso de Operadores (Aritméticos, Relacionais e Lógicos) e Desvios Condicionais (`se`/`senao`).
- **Automação:** Implementação de Laços de Repetição (`para`, `enquanto`, `faca-enquanto`).
- **Modularização:** Organização do código através de Sub-rotinas, Funções e Recursividade, além do uso de Bibliotecas nativas (ex: `Texto`, `Matematica`).
- **Gestão de Dados:** Manipulação de coleções via Vetores e Matrizes, e aplicação de estruturas lineares como Filas e Pilhas.

## 💻 Tecnologias Utilizadas

- **Linguagem:** Portugol _(Pseudo-código)_
- **IDE:** [Portugol Studio](http://univali.br/portugolstudio)

## 📋 Lista de Exercícios Resolvidos

_Abaixo estão os desafios abordados neste repositório. Clique em cada um para ver a descrição detalhada:_

<details>
<summary>
<b>1. Algoritmo / Entrada e Saída de Dados</b>
<br><i>Exercícios focados principalmente em ler dados, validar entrada e apresentar resultados.</i>
</summary>

- Questão 17 – Média de altura de homens e mulheres
- Questão 20 – Sistema de login com bloqueio após 3 tentativas

> - **Conteúdos envolvidos**:
>   - Entrada e saída
>   - Variáveis
>   - Condições simples

</details>

<details>
<summary>
<b>2. Operadores (Aritméticos, Relacionais e Lógicos)</b>
<br><i>Exercícios que exigem operações matemáticas ou comparações como parte central da lógica.</i>
</summary>

- Questão 1 – Exibir divisores de um número
- Questão 8 – Verificar se um número é primo

> - **Conteúdos envolvidos**:
>   - Operadores aritméticos (%, /, \*)
>   - Operadores relacionais (==, !=, <, >)

</details>

<details>
<summary>
<b>3. Desvios Condicionais (Se / Senão)</b>
<br><i>Exercícios cujo foco principal é tomar decisões com base em condições.</i>
</summary>

- Questão 7 – Verificar se um número é palíndromo
- Questão 19 – Contar números positivos até entrada negativa

> - **Conteúdos envolvidos**:
>   - if / else
>   - ccomparações lógicas

</details>

<details>
<summary>
<b>4. Laços de Repetição (Para, Enquanto, Faça Enquanto)</b>
<br><i>Exercícios que dependem principalmente de repetições para gerar resultados.</i>
</summary>

- Questão 9 – Sequência de Fibonacci
- Questão 14 – Triângulo retângulo de altura N

> - **Conteúdos envolvidos**:
>   - for / while
>   - controle de repetição

</details>

<details>
<summary>
<b>5. Subrotinas (Funções e Recursividade)</b>
<br><i>Exercícios cujo objetivo principal é dividir o algoritmo em funções ou aplicar recursão</i>
</summary>

- Questão 4 – Função de potenciação sem biblioteca
- Questão 10 – Inverter cadeia recursivamente
- Questão 12 – Fatorial usando recursão
- Questão 16 – Função para contar números negativos em vetor

> - **Conteúdos envolvidos**:
>   - funções
>   - parâmetros
>   - retorno
>   - recursividade

</details>

<details>
<summary>
<b>6. Estruturas de Dados – Vetores</b>
<br><i>Exercícios focados na manipulação de listas de dados.<i>
</summary>

- Questão 3 – Separar números pares e ímpares de um vetor
- Questão 5 – Ordenação de vetor
- Questão 11 – Média de números pares e ímpares do vetor
- Questão 15 – Soma de dois vetores

> - **Conteúdos envolvidos**:
>   - vetores
>   - loops
>   - manipulação de posições

</details>

<details>
<summary>
<b>7. Estruturas de Dados – Vetores</b>
<br><i>Exercícios que trabalham com dados organizados em tabela (linhas e colunas).</i>
</summary>

- Questão 6 – Verificar se matriz é identidade
- Questão 13 – Maior e menor valor da matriz 4x4
- Questão 18 – Soma da diagonal secundária da matriz
- Questão 21 – Linha com maior soma da matriz

> - **Conteúdos envolvidos**:
>   - matrizes
>   - loops aninhados
>   - comparação de valores

</details>

<details>
<summary>
<b>8. Manipulação de Texto</b>
<br><i>Exercícios que trabalham diretamente com strings.</i>
</summary>

- Questão 2 – Contar vogais em uma frase

> - **Conteúdos envolvidos**:
>   - strings
>   - bibliotecas de texto
>   - laços

</details>

---

# 🚀 Como Executar os Exercícios

1. **Clone o repositório:**
   ```bash
   git clone https://github.com/pedrohgmello/trabalho-final-logica-programacao-serratec.git
   ```
2. Abra o Portugol Studio.
   ![Imagem de exemplo para abri o Portugol Studio.](/IMG_EXEMPLO/image.png)

3. No menu superior, clique em Arquivo > Abrir Arquivo.
   ![Imagem de exemplo para abrir um arquivo parte 1](/IMG_EXEMPLO/image-1.png)

4. Selecione o arquivo .por referente ao exercício que deseja testar.
   ![Imagem de exemplo para abrir um arquivo parte 2](/IMG_EXEMPLO/image-2.png)

5. Clique no botão Executar (Play).
   ![Imagem de exemplo para Executar o código](/IMG_EXEMPLO/image-4.png)

# 👥 Colaboradores

|                                                                        Colaborador Link pasta                                                                         |                  link github                  |
| :-------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :-------------------------------------------: |
|       [**Enzo Bernado Carneiro Costa**](https://github.com/pedrohgmello/trabalho-final-logica-programacao-serratec/tree/main/Enzo%20Bernado%20Carneiro%20Costa)       |     [GitHub](https://github.com/Onzecimo)     |
|     [**Gabriel Wendling Vieira Ecard**](https://github.com/pedrohgmello/trabalho-final-logica-programacao-serratec/tree/main/Gabriel%20Wendling%20Vieira%20Ecard)     |   [GitHub](https://github.com/Gabrielw342)    |
|               [**Lucas Leal da Silva**](https://github.com/pedrohgmello/trabalho-final-logica-programacao-serratec/tree/main/Lucas%20Leal%20da%20SIlva)               |    [GitHub](https://github.com/Phonedison)    |
|        [**Pedro Henrique Gomes Mello**](https://github.com/pedrohgmello/trabalho-final-logica-programacao-serratec/tree/main/Pedro%20Henrique%20Gomes%20Mello)        |   [GitHub](https://github.com/pedrohgmello)   |
| [**Phelipe Damasio de Andrade Silva**](https://github.com/pedrohgmello/trabalho-final-logica-programacao-serratec/tree/main/Phelipe%20Damasio%20de%20Andrade%20Silva) | [GitHub](https://github.com/phelipe1327-cell) |
|      [**Valois Leite da Silva Costa**](https://github.com/pedrohgmello/trabalho-final-logica-programacao-serratec/tree/main/Valois%20Leite%20da%20Silva%20Costa)      |    [GitHub](https://github.com/valois1961)    |
