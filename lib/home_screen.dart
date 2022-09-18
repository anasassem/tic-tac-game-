import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic/my_provider.dart';

import 'game_logic.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  Player player = Player();

  @override
  Widget build(BuildContext context) {
    MyProvider Proval = Provider.of<MyProvider>(context);
    MyProvider Profun = Provider.of<MyProvider>(context, listen: false);
    List<Widget> _firsBlock(
        MyProvider proval, MyProvider profun, BuildContext context) {
      return [
        SwitchListTile.adaptive(
          value: Proval.isSwitched,
          title: const Text('Turn on/off two player',
              style: TextStyle(color: Colors.white, fontSize: 25)),
          onChanged: (bool newVal) => Profun.switchChange(newVal),
        ),
        Text("It's ${Proval.activePLayer} Turn",
            style: const TextStyle(color: Colors.white, fontSize: 25)),
      ];
    }

    List<Widget> _lastBlock(
        MyProvider proval, MyProvider profun, BuildContext context) {
      return [
        Text(Proval.result,
            style: const TextStyle(color: Colors.white, fontSize: 25)),
        ElevatedButton.icon(
            onPressed: () => Profun.repeat(),
            icon: const Icon(Icons.repeat),
            label: const Text('Repeat the Game')),
      ];
    }

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: MediaQuery.of(context).orientation == Orientation.portrait
            ? Column(
                children: [
                  ..._firsBlock(Proval, Profun, context),
                  _expanded(Proval, Profun, context),
                  ..._lastBlock(Proval, Profun, context),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        ..._firsBlock(Proval, Profun, context),
                        ..._lastBlock(Proval, Profun, context),
                      ],
                    ),
                  ),
                  _expanded(Proval, Profun, context),
                ],
              ),
      ),
    );
  }

  Expanded _expanded(
      MyProvider Proval, MyProvider Profun, BuildContext context) {
    return Expanded(
      child: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 3/4,
        children: List.generate(
          9,
          (index) => InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: Proval.gameOver ? null : () => Profun.onTap(index),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).shadowColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  Player.playerX.contains(index)
                      ? 'X'
                      : Player.playerY.contains(index)
                          ? 'O'
                          : '',
                  style: TextStyle(
                    color: Player.playerX.contains(index)
                        ? Colors.blue
                        : Colors.pink,
                    fontSize: 52,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
