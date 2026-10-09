// Desafio 1 - Jogo da Forca
import 'dart:io';
import 'dart:math';

const palavras = [
  'FLUTTER',
  'DART',
  'CELULAR',
  'ANDROID',
  'APLICATIVO',
  'VARIAVEL',
  'FUNCAO',
  'TECLADO',
  'PROGRAMA',
  'WIDGET',
];

const maxErros = 6;

// Um desenho para cada quantidade de erros (0 a 6)
const desenhos = [
  r'''
  +---+
  |   |
      |
      |
      |
      |
=========''',
  r'''
  +---+
  |   |
  O   |
      |
      |
      |
=========''',
  r'''
  +---+
  |   |
  O   |
  |   |
      |
      |
=========''',
  r'''
  +---+
  |   |
  O   |
 /|   |
      |
      |
=========''',
  r'''
  +---+
  |   |
  O   |
 /|\  |
      |
      |
=========''',
  r'''
  +---+
  |   |
  O   |
 /|\  |
 /    |
      |
=========''',
  r'''
  +---+
  |   |
  O   |
 /|\  |
 / \  |
      |
=========''',
];

String palavraOculta(String palavra, Set<String> acertos) =>
    palavra.split('').map((l) => acertos.contains(l) ? l : '_').join(' ');

void main() {
  final palavra = palavras[Random().nextInt(palavras.length)];
  final acertos = <String>{};
  final erros = <String>{};

  while (true) {
    print(desenhos[erros.length]);
    print('Palavra: ${palavraOculta(palavra, acertos)}');
    print('Letras erradas: ${erros.join(' ')}');

    if (palavra.split('').every(acertos.contains)) {
      print('Parabéns, você acertou! A palavra era $palavra.');
      break;
    }
    if (erros.length == maxErros) {
      print('Você perdeu! A palavra era $palavra.');
      break;
    }

    stdout.write('Digite uma letra: ');
    final letra = stdin.readLineSync()!.trim().toUpperCase();

    if (!RegExp(r'^[A-Z]$').hasMatch(letra)) {
      print('Digite apenas uma letra, sem acento.');
      continue;
    }
    if (acertos.contains(letra) || erros.contains(letra)) {
      print('Você já tentou a letra $letra.');
      continue;
    }

    if (palavra.contains(letra)) {
      acertos.add(letra);
    } else {
      erros.add(letra);
    }
  }
}
