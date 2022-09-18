import 'dart:math';

class Player {
  static const x = "X";
  static const y = "Y";
  static const empty = "";

  static List<int> playerX = [];
  static List<int> playerY = [];
}

extension ContainsAll on List {
  bool containsAll(int x, int y, [z]) {
    if(z==null)
      return contains(x) && contains(y);
    else
    return contains(x) && contains(y) && contains(z);
  }
}

class Game {
  void playGame(int index, String activePLayer) {
    activePLayer == "X" ? Player.playerX.add(index) : Player.playerY.add(index);
  }

  String checkWinner() {
    String winner = "";
    if (Player.playerX.containsAll(0, 1, 2) ||
        Player.playerX.containsAll(3, 4, 5) ||
        Player.playerX.containsAll(6, 7, 8) ||
        Player.playerX.containsAll(0, 3, 6) ||
        Player.playerX.containsAll(1, 4, 7) ||
        Player.playerX.containsAll(2, 5, 8) ||
        Player.playerX.containsAll(0, 4, 8) ||
        Player.playerX.containsAll(2, 4, 6)) {
      winner = "X";
    } else if (Player.playerY.containsAll(0, 1, 2) ||
        Player.playerY.containsAll(3, 4, 5) ||
        Player.playerY.containsAll(6, 7, 8) ||
        Player.playerY.containsAll(0, 3, 6) ||
        Player.playerY.containsAll(1, 4, 7) ||
        Player.playerY.containsAll(2, 5, 8) ||
        Player.playerY.containsAll(0, 4, 8) ||
        Player.playerY.containsAll(2, 4, 6)) {
      winner = "Hafsa";
    } else {
      winner = "";
    }

    return winner;
  }

  Future<void> autoPlay(activePLayer) async {
    int index = 0;
    List<int> emptyCells = [];

    for (var i = 0; i < 9; i++) {
      if (!(Player.playerX.contains(i) || Player.playerY.contains(i))) {
        emptyCells.add(i);
      }
    }

    if (Player.playerY.containsAll(0, 1) && emptyCells.contains(2))
      index = 2;
    else if (Player.playerY.containsAll(3, 4) && emptyCells.contains(5))
      index = 5;
    else if (Player.playerY.containsAll(6, 7) && emptyCells.contains(8))
      index = 8;
    else if (Player.playerY.containsAll(0, 3) && emptyCells.contains(6))
      index = 6;
    else if (Player.playerY.containsAll(1, 4) && emptyCells.contains(7))
      index = 7;
    else if (Player.playerY.containsAll(2, 5) && emptyCells.contains(8))
      index = 8;
    else if (Player.playerY.containsAll(1, 4) && emptyCells.contains(8))
      index = 8;
    else if (Player.playerY.containsAll(2, 4) && emptyCells.contains(6))
      index = 6;

    //start end
    else if (Player.playerY.containsAll(0, 2) && emptyCells.contains(1))
      index = 1;
    else if (Player.playerY.containsAll(3 ,5) && emptyCells.contains(4))
      index = 4;
    else if (Player.playerY.containsAll(6, 8) && emptyCells.contains(7))
      index = 7;
    else if (Player.playerY.containsAll(0, 6) && emptyCells.contains(3))
      index = 3;
    else if (Player.playerY.containsAll(1, 7) && emptyCells.contains(4))
      index = 4;
    else if (Player.playerY.containsAll(2, 8) && emptyCells.contains(5))
      index = 5;
    else if (Player.playerY.containsAll(0, 8) && emptyCells.contains(4))
      index = 4;
    else if (Player.playerY.containsAll(2, 6) && emptyCells.contains(4))
      index = 4;

    //center end
    else if (Player.playerY.containsAll(1, 2) && emptyCells.contains(0))
      index = 0;
    else if (Player.playerY.containsAll(4 ,5) && emptyCells.contains(3))
      index = 3;
    else if (Player.playerY.containsAll(7, 8) && emptyCells.contains(6))
      index = 6;
    else if (Player.playerY.containsAll(3, 6) && emptyCells.contains(0))
      index = 0;
    else if (Player.playerY.containsAll(4, 7) && emptyCells.contains(1))
      index = 1;
    else if (Player.playerY.containsAll(5, 8) && emptyCells.contains(2))
      index = 2;
    else if (Player.playerY.containsAll(4, 8) && emptyCells.contains(0))
      index = 0;
    else if (Player.playerY.containsAll(4, 6) && emptyCells.contains(2))
      index = 2;

    else if (Player.playerX.containsAll(0, 1) && emptyCells.contains(2))
      index = 2;
    else if (Player.playerX.containsAll(3, 4) && emptyCells.contains(5))
      index = 5;
    else if (Player.playerX.containsAll(6, 7) && emptyCells.contains(8))
      index = 8;
    else if (Player.playerX.containsAll(0, 3) && emptyCells.contains(6))
      index = 6;
    else if (Player.playerX.containsAll(1, 4) && emptyCells.contains(7))
      index = 7;
    else if (Player.playerX.containsAll(2, 5) && emptyCells.contains(8))
      index = 8;
    else if (Player.playerX.containsAll(1, 4) && emptyCells.contains(8))
      index = 8;
    else if (Player.playerX.containsAll(2, 4) && emptyCells.contains(6))
      index = 6;


    //start end
    else if (Player.playerX.containsAll(0, 2) && emptyCells.contains(1))
      index = 1;
    else if (Player.playerX.containsAll(3 ,5) && emptyCells.contains(4))
      index = 4;
    else if (Player.playerX.containsAll(6, 8) && emptyCells.contains(7))
      index = 7;
    else if (Player.playerX.containsAll(0, 6) && emptyCells.contains(3))
      index = 3;
    else if (Player.playerX.containsAll(1, 7) && emptyCells.contains(4))
      index = 4;
    else if (Player.playerX.containsAll(2, 8) && emptyCells.contains(5))
      index = 5;
    else if (Player.playerX.containsAll(0, 8) && emptyCells.contains(4))
      index = 4;
    else if (Player.playerX.containsAll(2, 6) && emptyCells.contains(4))
      index = 4;

    //center end
    else if (Player.playerX.containsAll(1, 2) && emptyCells.contains(0))
      index = 0;
    else if (Player.playerX.containsAll(4 ,5) && emptyCells.contains(3))
      index = 3;
    else if (Player.playerX.containsAll(7, 8) && emptyCells.contains(6))
      index = 6;
    else if (Player.playerX.containsAll(3, 6) && emptyCells.contains(0))
      index = 0;
    else if (Player.playerX.containsAll(4, 7) && emptyCells.contains(1))
      index = 1;
    else if (Player.playerX.containsAll(5, 8) && emptyCells.contains(2))
      index = 2;
    else if (Player.playerX.containsAll(4, 8) && emptyCells.contains(0))
      index = 0;
    else if (Player.playerX.containsAll(4, 6) && emptyCells.contains(2))
      index = 2;
    else if (Player.playerX.containsAll(7, 4) && emptyCells.contains(1))
      index = 1;
    else if (Player.playerX.containsAll(7, 4) && emptyCells.contains(1))
      index = 1;
    else if (Player.playerX.containsAll(0, 4) && emptyCells.contains(8))
      index = 8;
    else if (Player.playerX.containsAll(2, 8) && emptyCells.contains(5))
      index = 5;
    else {
      Random random = Random();
      int randomIndex = random.nextInt(emptyCells.length);

      index = emptyCells[randomIndex];
    }
    playGame(index, activePLayer);
  }
}
