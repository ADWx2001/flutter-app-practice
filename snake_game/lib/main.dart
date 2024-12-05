import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(SnakeGame());
}

class SnakeGame extends StatefulWidget {
  @override
  _SnakeGameState createState() => _SnakeGameState();
}

class _SnakeGameState extends State<SnakeGame> {
  static const int rows = 100;
  static const int columns = 100;
  static const int squareSize = 10;

  List<Point> snake = [Point(15, 15)];
  Point direction = Point(0, -1); // Moving up
  Point food = Point(5, 5);
  Timer? gameTimer;

  void startGame() {
    gameTimer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      setState(() {
        moveSnake();
        checkCollision();
      });
    });
  }

  void moveSnake() {
    Point newHead = snake.first + direction;
    snake.insert(0, newHead);
    if (newHead != food) {
      snake.removeLast();
    } else {
      spawnFood();
    }
  }

  void spawnFood() {
    Random random = Random();
    food = Point(random.nextInt(columns), random.nextInt(rows));
  }

  void checkCollision() {
    Point head = snake.first;
    if (head.x < 0 ||
        head.y < 0 ||
        head.x >= columns ||
        head.y >= rows ||
        snake.skip(1).contains(head)) {
      gameTimer?.cancel();
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Game Over'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                resetGame();
              },
              child: Text('Restart'),
            ),
          ],
        ),
      );
    }
  }

  void resetGame() {
    setState(() {
      snake = [Point(10, 10)];
      direction = Point(0, -1);
      food = Point(5, 5);
      startGame();
    });
  }

  void changeDirection(Point newDirection) {
    if ((direction.x + newDirection.x != 0) ||
        (direction.y + newDirection.y != 0)) {
      direction = newDirection;
    }
  }

  @override
  void dispose() {
    gameTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Snake Game')),
        body: GestureDetector(
          onVerticalDragUpdate: (details) {
            if (details.delta.dy > 0) changeDirection(Point(0, 1)); // Down
            else if (details.delta.dy < 0) changeDirection(Point(0, -1)); // Up
          },
          onHorizontalDragUpdate: (details) {
            if (details.delta.dx > 0) changeDirection(Point(1, 0)); // Right
            else if (details.delta.dx < 0) changeDirection(Point(-1, 0)); // Left
          },
          child: Center(
            child: Container(
              width: columns * squareSize.toDouble(),
              height: rows * squareSize.toDouble(),
              color: Colors.black,
              child: Stack(
                children: [
                  for (var point in snake)
                    Positioned(
                      left: point.x * squareSize.toDouble(),
                      top: point.y * squareSize.toDouble(),
                      child: Container(
                        width: squareSize.toDouble(),
                        height: squareSize.toDouble(),
                        color: Colors.green,
                      ),
                    ),
                  Positioned(
                    left: food.x * squareSize.toDouble(),
                    top: food.y * squareSize.toDouble(),
                    child: Container(
                      width: squareSize.toDouble(),
                      height: squareSize.toDouble(),
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: startGame,
          child: Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}

extension on Point {
  Point operator +(Point other) => Point(x + other.x, y + other.y);
}
