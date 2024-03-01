import 'package:get_it/get_it.dart';

import 'cubits/game_cubit.dart';
import 'cubits/settings_cubit.dart';

createAppBlocs() {
  GetIt.I.registerSingleton<GameCubit>(GameCubit.initial());
  GetIt.I.registerSingleton<SettingsCubit>(SettingsCubit.initial());
}
