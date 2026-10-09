// Desafio 2 - Jogo da Velha
import 'dart:io';

// Linhas, colunas e diagonais que dão vitória
const linhasVitoria = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6],
];

void desenharTabuleiro(List<String> t) {
  print('');
  print(' ${t[0]} | ${t[1]} | ${t[2]} ');
  print('---+---+---');
  print(' ${t[3]} | ${t[4]} | ${t[5]} ');
  print('---+---+---');
  print(' ${t[6]} | ${t[7]} | ${t[8]} ');
  print('');
}

bool venceu(List<String> t, String simbolo) =>
    linhasVitoria.any((linha) => linha.every((i) => t[i] == simbolo));

void main() {
  // Casas vazias mostram o número da posição
  final tabuleiro = List.generate(9, (i) => '${i + 1}');
  String jogador = 'X';
  int jogadas = 0;

  while (true) {
    desenharTabuleiro(tabuleiro);
    stdout.write('Jogador $jogador, escolha uma posição (1-9): ');
    final pos = int.tryParse(stdin.readLineSync()!.trim());

    if (pos == null || pos < 1 || pos > 9) {
      print('Posição inválida!');
      continue;
    }
    if (tabuleiro[pos - 1] == 'X' || tabuleiro[pos - 1] == 'O') {
      print('Essa casa já está ocupada!');
      continue;
    }

    tabuleiro[pos - 1] = jogador;
    jogadas++;

    if (venceu(tabuleiro, jogador)) {
      desenharTabuleiro(tabuleiro);
      print('Jogador $jogador venceu!');
      break;
    }
    if (jogadas == 9) {
      desenharTabuleiro(tabuleiro);
      print('Deu velha! Empate.');
      break;
    }

    jogador = jogador == 'X' ? 'O' : 'X';
  }
}
