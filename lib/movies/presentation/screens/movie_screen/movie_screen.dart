import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/movies/presentation/components/popular_movies_class.dart';
import 'package:untitled1/movies/presentation/controller/movies_event.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/services/services_locator.dart';
import '../../components/dvider.dart';
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
              PopularMoviesComponent(),
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

