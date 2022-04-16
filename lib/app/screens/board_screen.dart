import 'package:flutter/material.dart';
// import 'package:stockfish/stockfish.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({Key? key}) : super(key: key);
  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardAction {
  final String label;
  final Widget icon;

  _BoardAction(this.label, this.icon);
}

class _BoardScreenState extends State<BoardScreen> {
  // static final stockfish = Stockfish();
  ChessBoardController controller = ChessBoardController();
  String movesHistory = '';
  List<BoardArrow> arrows = [
    BoardArrow(
      from: 'd2',
      to: 'd4',
      color: Colors.red.withOpacity(0.5),
    ),
  ];
  final List<_BoardAction> _boardActions = [
    _BoardAction('Restart', const Icon(Icons.refresh)),
    _BoardAction('Undo', const Icon(Icons.undo)),
    _BoardAction('Redo', const Icon(Icons.redo)),
  ];

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        movesHistory = controller.getSan().fold(
              '',
              (previousValue, element) =>
                  previousValue + '\n' + (element ?? ''),
            );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ChessBoard(
            controller: controller,
            boardColor: BoardColor.orange,
            boardOrientation: PlayerColor.white,
            arrows: arrows,
          ),
          BottomNavigationBar(
            onTap: (value) =>
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(_boardActions[value].label),
            )),
            items: _boardActions
                .map((e) =>
                    BottomNavigationBarItem(icon: e.icon, label: e.label))
                .toList(),
          ),
          Text(movesHistory),
        ],
      ),
    );
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   stockfish.dispose();
  // }
}
