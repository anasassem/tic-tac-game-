import 'package:flutter/material.dart';
import 'package:tic/game_logic.dart';

class MyProvider with ChangeNotifier {
  String activePLayer = 'X';
  bool gameOver = false;
  int turns = 0;
  String result = "";
  Game game = Game();
  bool isSwitched = false;
  Player player = Player();

  void switchChange(bool value) {
    isSwitched = value;
    notifyListeners();
  }

  void onTap(index) async {
    if ((Player.playerX.isEmpty ||
        !Player.playerX.contains(index)) &&
        (Player.playerY.isEmpty ||
            !Player.playerY.contains(index))) {
      game.playGame(index, activePLayer);
      updateState();

      if (!isSwitched && !gameOver&& turns!=9) {
        await game.autoPlay(activePLayer);
        updateState();
      }
    }
    notifyListeners();
  }

  void updateState() {
    activePLayer = activePLayer == "X" ? "O" : "X";
    turns++;
    String winnerPlayer = game.checkWinner();
    if (winnerPlayer != "") {
      gameOver=true;
      result = "winner player is $winnerPlayer";
    }
    else if (!gameOver && turns == 9) {
      result = "It's Draw";
    }
    notifyListeners();
  }

  void repeat() {
    activePLayer = 'X';
    gameOver = false;
    turns = 0;
    result = "";
    game = Game();
    Player.playerX = [];
    Player.playerY = [];
    notifyListeners();
  }
}
