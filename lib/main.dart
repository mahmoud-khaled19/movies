import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/app/resources/strings_manager.dart';
import 'package:untitled1/app/services/services_locator.dart';
import 'package:untitled1/movies/presentation/controller/theme_mode_cubit.dart';

import 'app/resources/routes_manager.dart';
import 'app/resources/theme_manager.dart';
import 'movies/presentation/components/shared_preferences.dart';
import 'movies/presentation/controller/theme_mode_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  ServicesLocator().init();
  bool isDark = CacheHelper.getDate(key: 'isDark') ?? false;
  runApp( MyApp(isDark: isDark,));
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  const MyApp({required this.isDark,super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeModeCubit()..changeMode(fromShared: isDark),
      child: BlocBuilder<ThemeModeCubit, ThemeModeState>(
        builder: (context, state) {
          ThemeModeCubit cubit = BlocProvider.of(context);
          return MaterialApp(
            title: AppStrings.appTitle,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: RoutesManager.splashRoute,
            theme: cubit.isDark
                ? getLightApplicationTheme()
                : getDarkApplicationTheme(),
          );
        },
      ),
    );
  }
}
