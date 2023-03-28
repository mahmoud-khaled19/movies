import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/app/services/services_locator.dart';
import 'package:untitled1/movies/presentation/controller/theme_mode_cubit.dart';
import 'app/resources/routes_manager.dart';
import 'app/resources/theme_manager.dart';
import 'generated/codegen_loader.g.dart';
import 'movies/presentation/components/shared_preferences.dart';
import 'movies/presentation/controller/theme_mode_state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();
  ServicesLocator().init();
  bool isDark = CacheHelper.getDate(key: 'is Dark') ?? false;
  runApp(EasyLocalization(
    useOnlyLangCode: true,
    saveLocale: true,
    supportedLocales: const [Locale('en', 'US'), Locale('ar', 'SA')],
    fallbackLocale: const Locale('en'),
    path: 'assets/translations',
    child: MyApp(
      isDark: isDark,
    ),
  ));
}

/// Flutter pub run easy_localization:generate -h

class MyApp extends StatelessWidget {
  final bool? isDark;

  const MyApp({required this.isDark, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeModeCubit()..changeMode(fromShared: isDark),
      child: BlocBuilder<ThemeModeCubit, ThemeModeState>(
        builder: (context, state) {
          ThemeModeCubit cubit = BlocProvider.of(context);
          return MaterialApp(
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            locale: context.locale,
            title: 'Movies',
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
