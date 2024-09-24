import 'package:flutter/material.dart';
import 'algoTTT.dart';

class TicTacToeGame extends StatefulWidget {
  @override
  _TicTacToeGameState createState() => _TicTacToeGameState();
}

class _TicTacToeGameState extends State<TicTacToeGame> {
  TicTacToeLogic game = TicTacToeLogic(); // Instance de la logique du jeu

  void handleMove(int row, int col) {
    setState(() {
      game.handleMove(row, col);
      String? winner = game.getWinner(row, col);
      if (winner != null) endGame(winner);
    });
  }

  void endGame(String? winner) {
 void showResultDialog(String? winner) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.white,
      title: Center(
        child: Text(
          winner != null ? "🎉 Victoire!" : "🤝 Match nul!",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurpleAccent),
        ),
      ),
      content: Text(
        winner != null ? "Le joueur $winner a remporté la partie." : "Personne n'a gagné cette fois.",
        style: TextStyle(fontSize: 18, color: Color.fromARGB(136, 204, 161, 161)),
        textAlign: TextAlign.center,
      ),
      actions: [
        ElevatedButton(
          onPressed: resetGame,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: Text("Rejouer", style: TextStyle(color: Colors.white, fontSize: 16)),
        ),
      ],
    ),
  );
}

  }

  void resetGame() {
    setState(() {
      game.resetGame();
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: List.generate(3, (row) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (col) {
                  return GestureDetector(
                    onTap: () => handleMove(row, col),
                    child: Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 6,
                            offset: Offset(3, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          game.grid[row][col],
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: game.grid[row][col] == "X"
                                ? Colors.orange
                                : Colors.blueAccent,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              );
            }),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: resetGame,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              backgroundColor: Colors.deepPurpleAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              "Rejouer",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: TicTacToeGame()));
}
