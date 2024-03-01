import 'package:chess_app/models/figure.dart';
import 'package:chess_app/models/game_colors.dart';

import '../cell.dart';
import '../cell_calculator.dart';
import '../figure_types.dart';

class Queen extends Figure {
  Queen({required GameColors color, required Cell cell})
      : super(color: color, cell: cell, type: FigureTypes.queen);

  @override
  bool availableForMove(Cell to) {
    if (!super.availableForMove(to)) return false;
    return CellCalculator.hasWayForQueen(cell, to);
  }
}
