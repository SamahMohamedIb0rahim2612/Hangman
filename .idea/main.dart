import 'dart:io';

void main() {
  print('Welcome to Hangman, guess the right color or...!');

  List<String> words = ['blue', 'pink', 'black', 'gold', 'purple', 'red'];

  String selectedWord = words[_getRandomNumber(words.length)];

  List<String> guessedLetters = List<String>.filled(selectedWord.length, '_');

  int attempts = 10;

  List<String> incorrectGuesses = [];

  while (attempts > 0 && guessedLetters.contains('_'))
  {
    printHangman(attempts);
    print('Word: ${guessedLetters.join(' ')}');
    print('Attempts left: $attempts');

    if (incorrectGuesses.isNotEmpty) {
      print('Incorrect guesses: ${incorrectGuesses.join(', ')}');
    }

    String guess = _getUserInput('Enter a letter:');

    if (guessedLetters.contains(guess) || incorrectGuesses.contains(guess)) {
      print('You already guessed that letter!');
      continue;
    }

    bool correctGuess = false;
    for (int i = 0; i < selectedWord.length; i++) {
      if (selectedWord[i] == guess) {
        guessedLetters[i] = guess;
        correctGuess = true;
      }
    }

    if (correctGuess) {
      print('Correct guess!');
    } else {
      print('Wrong guess!');
      attempts--;
      incorrectGuesses.add(guess);
    }
  }

  printHangman(attempts);

  if (!guessedLetters.contains('_')) {
    print('Congratulations! You guessed the word: $selectedWord');
  } else {
    print('You lost! The word was: $selectedWord');
  }
}

int _getRandomNumber(int max) {
  return DateTime.now().microsecondsSinceEpoch % max;
}

String _getUserInput(String prompt) {
  stdout.write('$prompt ');
  return stdin.readLineSync()!;
}
void printHangman(int attempts) {
  List<String> hangmanImages = [
    '''
     _______
    |/      |
    |      
    |     
    |      
    |     
    |
    ''',
    '''
     _______
    |/      |
    |      (_)
    |     
    |      
    |     
    |
    ''',
    '''
     _______
    |/      |
    |      (_)
    |       |
    |       |
    |      
    |
    ''',
    '''
     _______
    |/      |
    |      (_)
    |      \\|
    |       |
    |      
    |
    ''',
    '''
     _______
    |/      |
    |      (_)
    |      \\|/
    |       |
    |      
    |
    ''',
    '''
     _______
    |/      |
    |      (_)
    |      \\|/
    |       |
    |      /
    |
    ''',
    '''
     _______
    |/      |
    |      (_)
    |      \\|/
    |       |
    |      / \\
    |
    ''',
  ];

  print(hangmanImages[10 - attempts]);
}
