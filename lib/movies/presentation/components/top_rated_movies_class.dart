import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:untitled1/movies/presentation/controller/movie_bloc.dart';

import '../../../app/network_constance/enum.dart';
import '../../../app/network_constance/network_constance.dart';
import '../../../app/resources/strings_manager.dart';
import '../../../app/resources/values_manager.dart';
import '../controller/movie_states.dart';
import '../screens/movie_details_screen/movie_details_screen.dart';

class TopRatedMoviesClass extends StatelessWidget {
  const TopRatedMoviesClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.topRatedMoviesState != current.topRatedMoviesState,
      builder: (context, state) {
        switch (state.topRatedMoviesState) {
          case RequestState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case RequestState.success:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: AppSize.s170,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
                  itemCount: state.topRatedMovies.length,
                  itemBuilder: (context, index) {
                    final movie = state.topRatedMovies[index];
                    return Container(
                      padding: const EdgeInsets.only(right: AppSize.s8),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MovieDetailScreen(
                                        id: movie.id,
                                      )));
                        },
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular( AppSize.s8)),
                          child: CachedNetworkImage(
                            width:  AppSize.s100,
                            fit: BoxFit.cover,
                            imageUrl: NetworkConstance.imageUrl(movie.image),
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height:  AppSize.s170,
                                width:  AppSize.s100,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    );
                  },
                ),
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
