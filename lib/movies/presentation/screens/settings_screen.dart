import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/app/resources/strings_manager.dart';
import 'package:untitled1/app/resources/values_manager.dart';
import 'package:untitled1/movies/presentation/controller/theme_mode_state.dart';

import '../controller/theme_mode_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeModeCubit, ThemeModeState>(
      builder: (context, state) {
        ThemeModeCubit cubit = BlocProvider.of(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title:  Text(AppStrings.settings,style: Theme.of(context).textTheme.titleLarge,),
          ),
          body: Padding(
            padding: const EdgeInsets.all(AppSize.s10),
            child: Column(
              children: [
                const SizedBox(
                  height: AppSize.s40,
                ),
                Row(
                  children: [
                    Text(
                      cubit.isDark ? AppStrings.lightMode : AppStrings.darkMode,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        cubit.changeMode();
                      },
                      child: Icon(
                        cubit.isDark ? Icons.brightness_4 : Icons.dark_mode,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
