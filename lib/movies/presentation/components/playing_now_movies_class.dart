import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/app/network_constance/enum.dart';
import 'package:untitled1/app/resources/values_manager.dart';
import 'package:untitled1/movies/presentation/controller/movie_bloc.dart';
import '../../../app/network_constance/network_constance.dart';
import '../../../app/resources/constats.dart';
import '../../../app/resources/strings_manager.dart';
import '../controller/movie_states.dart';
import '../screens/movie_details_screen/movie_details_screen.dart';

class PlayingNowMoviesComponent extends StatelessWidget {
  const PlayingNowMoviesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? style = Theme.of(context).textTheme.titleLarge;
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.nowPlayingMoviesState != current.nowPlayingMoviesState,
      builder: (BuildContext context, state) {
        switch (state.nowPlayingMoviesState) {
          case RequestState.loading:
            return const SizedBox(
                height: AppSize.s400,
                child: Center(child: CircularProgressIndicator()));
          case RequestState.success:
            return FadeIn(
              duration: const Duration(seconds: AppConstants.pageViewTimer),
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 1,
                  autoPlayCurve: Curves.easeIn,
                  height: AppSize.s400,
                  viewportFraction: 1.0,
                ),
                items: state.nowPlayingMovies.map(
                  (item) {
                    return GestureDetector(
                      key: const Key('openMovieMinimalDetail'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MovieDetailScreen(
                                      id: item.id,
                                    )));
                      },
                      child: Stack(
                        children: [
                          ShaderMask(
                            shaderCallback: (rect) {
                              return const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  // fromLTRB
                                  Colors.transparent,
                                  Colors.black,
                                  Colors.black,
                                  Colors.transparent,
                                ],
                                stops: [0, 0.3, 0.8, 1],
                              ).createShader(
                                Rect.fromLTRB(0, 0, rect.width, rect.height),
                              );
                            },
                            blendMode: BlendMode.dstIn,
                            child: CachedNetworkImage(
                              height: AppSize.s400,
                              imageUrl: NetworkConstance.imageUrl(item.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: AppPadding.p16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        color: Colors.redAccent,
                                        size: AppSize.s16,
                                      ),
                                      const SizedBox(width: AppSize.s4),
                                      Text(
                                        AppStrings.nowPlaying.toUpperCase(),
                                        style: style,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: AppPadding.p16),
                                  child: Text(item.title,
                                      textAlign: TextAlign.center,
                                      style: style),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
            );
          case RequestState.error:
            return const SizedBox(
              child: Text(AppStrings.noDataFound),
            );
        }
      },
    );
  }
}
