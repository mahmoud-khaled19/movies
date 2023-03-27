import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/movies/presentation/components/shared_preferences.dart';
import 'package:untitled1/movies/presentation/controller/theme_mode_state.dart';

class ThemeModeCubit extends Cubit<ThemeModeState> {
  ThemeModeCubit() : super(ThemeModeInitial());

  static ThemeModeCubit get(context) => BlocProvider.of(context);
  bool isDark = false;

  void changeMode({bool? fromShared}) {
    if (fromShared == null) {
      isDark = !isDark;
      CacheHelper.saveData(key: 'isDark', value: isDark);
      emit(ChangeThemeMode());
    } else {
      isDark = fromShared;
      emit(ChangeThemeMode());
    }
  }
}
