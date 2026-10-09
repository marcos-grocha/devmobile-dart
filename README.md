# Desafios – Linguagem Dart

**Universidade Tiradentes (UNIT)**  
**Disciplina:** Programação para Dispositivos Móveis  
**Professora:** Layse Santos Souza

## Aluno

- Marcos Araujo Goulart

## Como rodar

Cada desafio está em um arquivo separado dentro da pasta `desafios`. Para rodar, a partir da raiz do repositório:

```
dart run desafios/desafio01_forca.dart
dart run desafios/desafio02_velha.dart
dart run desafios/desafio03_labirinto.dart
```

### Rodando com Docker (sem instalar o Dart)

Com o Docker Desktop aberto, rode no PowerShell a partir da raiz do repositório:

```
docker run -it --rm -v "${PWD}:/app" -w /app dart:stable dart run desafios/desafio01_forca.dart
```

Para os outros desafios, é só trocar o nome do arquivo.

Para verificar se o código compila sem erros:

```
docker run --rm -v "${PWD}:/app" -w /app dart:stable dart analyze desafios
```

## Observações

- Desafio 1 (Forca): a palavra é sorteada de uma lista fixa dentro do código. O jogador tem 6 erros (cabeça, corpo, dois braços e duas pernas). As palavras não têm acento, então só são aceitas letras de A a Z. Repetir uma letra já tentada não conta como erro.
- Desafio 2 (Jogo da Velha): dois jogadores no mesmo terminal, começando pelo X. As casas vazias mostram o número da posição (1 a 9), que é o que o jogador digita. Posição inválida ou ocupada pede a jogada de novo. Se as 9 casas forem preenchidas sem vencedor, dá velha.
- Desafio 3 (Labirinto): o personagem é o `P`, as paredes são `#` e a saída é o `S`. O movimento é com W/A/S/D + Enter, porque ler tecla por tecla não funciona bem em todos os terminais do Windows. Dá para digitar vários movimentos de uma vez (ex: `ddss`); se bater numa parede, os movimentos seguintes daquela linha são ignorados. O labirinto tem becos sem saída e só um caminho até a saída.
