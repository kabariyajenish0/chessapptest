import 'package:chess_app/models/figure.dart';
import 'package:chess_app/models/game_colors.dart';

import '../cell.dart';
import '../cell_calculator.dart';
import '../figure_types.dart';

class King extends Figure {
  King({required GameColors color, required Cell cell})
      : super(color: color, cell: cell, type: FigureTypes.king);

  @override
  bool availableForMove(Cell to) {
    if (!super.availableForMove(to)) {
      return false;
    }

    return CellCalculator.hasWayForKing(cell, to);
  }
}
