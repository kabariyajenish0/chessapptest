import 'package:chess_app/models/figure.dart';
import 'package:chess_app/models/game_colors.dart';

import '../cell.dart';
import '../cell_calculator.dart';
import '../figure_types.dart';

class Rook extends Figure {
  Rook({required GameColors color, required Cell cell})
      : super(color: color, cell: cell, type: FigureTypes.rook);

  @override
  bool availableForMove(Cell to) {
    if (!super.availableForMove(to)) return false;
    return CellCalculator.hasWayForRook(cell, to);
  }
}
