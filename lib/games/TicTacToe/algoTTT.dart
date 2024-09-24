

class TicTacToeLogic {
  List<List<String>> grid = List.generate(3, (_) => List.filled(3, ""));
  bool isXNext = true, gameOver = false;

  void handleMove(int row, int col) {
    if (grid[row][col] == "" && !gameOver) {
      grid[row][col] = isXNext ? "X" : "O";
      isXNext = !isXNext;
    }
  }

  bool checkWinner(int row, int col) {
    String player = grid[row][col];
    return (grid[row].every((cell) => cell == player) ||
            grid.every((r) => r[col] == player) ||
            [0, 1, 2].every((i) => grid[i][i] == player) ||
            [0, 1, 2].every((i) => grid[i][2 - i] == player));
  }

  bool isGridFull() {
    return grid.every((row) => row.every((cell) => cell != ""));
  }

  void resetGame() {
    grid = List.generate(3, (_) => List.filled(3, ""));
    isXNext = true;
    gameOver = false;
  }

  String? getWinner(int row, int col) {
    if (checkWinner(row, col)) {
      gameOver = true;
      return grid[row][col];
    } else if (isGridFull()) {
      gameOver = true;
      return null; // Match nul
    }
    return null; // Pas encore de gagnant
  }
}
