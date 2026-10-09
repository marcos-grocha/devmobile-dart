// Desafio 3 - Jogo do Labirinto
import 'dart:io';

// # = parede, P = jogador, S = saída
const mapa = [
  '###############',
  '#P            #',
  '# ### # ##### #',
  '#   # #     # #',
  '### # ##### # #',
  '#   #     # # #',
  '# ####### # # #',
  '#       # #   #',
  '####### # #####',
  '#       #     S',
  '###############',
];

// Deslocamento [linha, coluna] de cada comando
const direcoes = {
  'w': [-1, 0],
  'a': [0, -1],
  's': [1, 0],
  'd': [0, 1],
};

void desenharLabirinto(List<List<String>> lab) {
  print('');
  for (final linha in lab) {
    print(linha.join());
  }
  print('');
}

void main() {
  final lab = mapa.map((l) => l.split('')).toList();

  int linha = 0, coluna = 0;
  for (int i = 0; i < lab.length; i++) {
    final j = lab[i].indexOf('P');
    if (j != -1) {
      linha = i;
      coluna = j;
    }
  }

  int passos = 0;
  print('Encontre a saída (S)!');
  print('Use W (cima), A (esquerda), S (baixo), D (direita) e Enter.');
  print('Dá para digitar vários movimentos de uma vez (ex: ddss). Q para sair.');

  while (true) {
    desenharLabirinto(lab);
    stdout.write('Movimento: ');
    final comandos = stdin.readLineSync()!.trim().toLowerCase();

    if (comandos == 'q') {
      print('Você desistiu depois de $passos passos.');
      return;
    }

    for (final c in comandos.split('')) {
      final d = direcoes[c];
      if (d == null) {
        print('Comando "$c" inválido, use W, A, S ou D.');
        break;
      }

      final novaLinha = linha + d[0];
      final novaColuna = coluna + d[1];
      final destino = lab[novaLinha][novaColuna];

      if (destino == '#') {
        print('Tem uma parede aí!');
        break;
      }

      lab[linha][coluna] = ' ';
      linha = novaLinha;
      coluna = novaColuna;
      lab[linha][coluna] = 'P';
      passos++;

      if (destino == 'S') {
        desenharLabirinto(lab);
        print('Parabéns! Você encontrou a saída em $passos passos.');
        return;
      }
    }
  }
}
