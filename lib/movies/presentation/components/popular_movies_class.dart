import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:untitled1/app/network_constance/enum.dart';
import 'package:untitled1/app/resources/values_manager.dart';
import 'package:untitled1/movies/presentation/controller/movie_bloc.dart';
import 'package:untitled1/movies/presentation/controller/movie_states.dart';

import '../../../app/network_constance/network_constance.dart';
import '../../../app/resources/strings_manager.dart';
import '../screens/movie_details_screen/movie_details_screen.dart';

class PopularMoviesComponent extends StatelessWidget {
  const PopularMoviesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.popularMoviesState != current.popularMoviesState,
      builder: (BuildContext context, state) {
        switch (state.popularMoviesState) {
          case RequestState.loading:
            return const Center(child: CircularProgressIndicator());
          case RequestState.success:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: AppSize.s170,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p16),
                  itemCount: state.popularMovies.length,
                  itemBuilder: (context, index) {
                    final movie = state.popularMovies[index];
                    return Container(
                      padding: const EdgeInsets.only(right: AppPadding.p8),
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
                              const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage(
                            width: AppSize.s100,
                            fit: BoxFit.cover,
                            imageUrl: NetworkConstance.imageUrl(movie.image),
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: AppSize.s170,
                                width: AppSize.s100,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s8),
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
            return const Center(
              child: Text(AppStrings.noDataFound),
            );
        }
      },
    );
  }
}
