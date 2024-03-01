import 'package:flutter/material.dart';

void main() {
  runApp(TicTacToe());
}

class TicTacToe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primaryColor: Colors.blueGrey[900],
        hintColor: Colors.cyanAccent,
        scaffoldBackgroundColor: Colors.blueGrey[50],
      ),
      home: TicTacToeBoard(),
    );
  }
}

class TicTacToeBoard extends StatefulWidget {
  @override
  _TicTacToeBoardState createState() => _TicTacToeBoardState();
}

class _TicTacToeBoardState extends State<TicTacToeBoard> {
  late List<List<String>> board;
  late bool playerX;
  late bool gameOver;
  int? winningRow;
  int? winningCol;
  late bool winningDiagonal;

  @override
  void initState() {
    super.initState();
    initializeBoard();
  }

  void initializeBoard() {
    board = List.generate(3, (_) => List.filled(3, ''));
    playerX = true;
    gameOver = false;
    winningRow = null;
    winningCol = null;
    winningDiagonal = false;
  }

  void makeMove(int row, int col) {
    if (!gameOver && board[row][col].isEmpty) {
      setState(() {
        board[row][col] = playerX ? 'X' : 'O';
        checkWinner(row, col);
        playerX = !playerX;
      });
    }
  }

  Widget getIcon(String value) {
    if (value == 'X') {
      return Icon(
        Icons.clear,
        size: 60,
        color: Colors.black,
      );
    } else if (value == 'O') {
      return Icon(
        Icons.radio_button_unchecked,
        size: 60,
        color: Colors.red,
      );
    }
    return SizedBox.shrink();
  }

  void checkWinner(int row, int col) {
    // Check row
    if (board[row][0] == board[row][1] &&
        board[row][1] == board[row][2] &&
        board[row][0].isNotEmpty) {
      gameOver = true;
      winningRow = row;
      return;
    }
    // Check column
    if (board[0][col] == board[1][col] &&
        board[1][col] == board[2][col] &&
        board[0][col].isNotEmpty) {
      gameOver = true;
      winningCol = col;
      return;
    }
    // Check diagonals
    if ((row == col || row + col == 2) &&
        ((board[0][0] == board[1][1] && board[1][1] == board[2][2]) ||
            (board[0][2] == board[1][1] && board[1][1] == board[2][0])) &&
        board[1][1].isNotEmpty) {
      gameOver = true;
      winningDiagonal = true;
      return;
    }
    // Check draw
    if (!gameOver &&
        board.every((row) => row.every((cell) => cell.isNotEmpty))) {
      gameOver = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tic Tac Toe',
          style: TextStyle(color: Colors.blueGrey[900]),
        ),
        backgroundColor: Colors.cyanAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Player ${playerX ? 'X' : 'O'}\'s Turn',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                3,
                (row) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (col) => GestureDetector(
                      onTap: () => makeMove(row, col),
                      child: CustomPaint(
                        size: Size(100, 100),
                        painter: BorderPainter(),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: (winningRow == row ||
                                    winningCol == col ||
                                    (winningDiagonal &&
                                        (row == 0 && col == 0 ||
                                            row == 1 && col == 1 ||
                                            row == 2 && col == 2 ||
                                            row == 0 && col == 2 ||
                                            row == 2 && col == 0)))
                                ? Colors.green.withOpacity(0.5)
                                : null,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(child: getIcon(board[row][col])),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Visibility(
              visible: gameOver,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    initializeBoard();
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyanAccent,
                  onPrimary: Colors.blueGrey[900],
                ),
                child: Text('Play Again'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 3.0
      ..shader = LinearGradient(
        colors: [Colors.red.shade900, Colors.blue.shade900],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0.0, 0.0, size.width, size.height));

    final double halfStrokeWidth = paint.strokeWidth / 2;
    final double width = size.width;
    final double height = size.height;

    // Draw the top border
    canvas.drawLine(
        Offset(0, halfStrokeWidth), Offset(width, halfStrokeWidth), paint);
    // Draw the left border
    canvas.drawLine(
        Offset(halfStrokeWidth, 0), Offset(halfStrokeWidth, height), paint);
    // Draw the bottom border
    canvas.drawLine(Offset(0, height - halfStrokeWidth),
        Offset(width, height - halfStrokeWidth), paint);
    // Draw the right border
    canvas.drawLine(Offset(width - halfStrokeWidth, 0),
        Offset(width - halfStrokeWidth, height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
