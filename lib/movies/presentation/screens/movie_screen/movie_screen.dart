import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled1/app/resources/colors_manager.dart';
import 'package:untitled1/movies/presentation/components/popular_movies_class.dart';
import 'package:untitled1/movies/presentation/controller/movies_event.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/services/services_locator.dart';
import '../../components/playing_now_movies_class.dart';
import '../../components/top_rated_movies_class.dart';
import '../../controller/movie_bloc.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<MoviesBloc>()
        ..add(GetPlayingNowMoviesEvent())
        ..add(GetTopRatedMoviesEvent())
        ..add(GetPopularMoviesEvent()),

      child: Scaffold(
        backgroundColor: ColorManager.darkGrey,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          key: const Key('movie Scroll View'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              PlayingNowMoviesComponent(),
              DividerClass(
                title: AppStrings.popular,
                textSeeMore: AppStrings.seeMore,
              ),
              PopularMoviesClass(),
              DividerClass(
                title: AppStrings.topRated,
                textSeeMore: AppStrings.seeMore,
              ),
              TopRatedMoviesClass(),
              SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}

class DividerClass extends StatelessWidget {
  const DividerClass({
    Key? key,
    required this.textSeeMore,
    required this.title,
  }) : super(key: key);

  final String title;
  final String textSeeMore;

  @override
  Widget build(BuildContext context) {
    TextStyle? style = Theme.of(context)
        .textTheme
        .headlineMedium
        ?.copyWith(fontWeight: FontWeight.w700);
    return Container(
      margin: const EdgeInsets.fromLTRB(
        16.0,
        24.0,
        16.0,
        8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
                fontSize: 19,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.15,
                color: ColorManager.white),
          ),
          InkWell(
            onTap: () {
              /// TODO : NAVIGATION TO POPULAR SCREEN
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    textSeeMore,
                    style: style,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16.0,
                    color: ColorManager.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
