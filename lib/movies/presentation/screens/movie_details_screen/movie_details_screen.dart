import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:untitled1/app/network_constance/network_constance.dart';
import 'package:untitled1/app/resources/fonts_manager.dart';
import 'package:untitled1/app/resources/strings_manager.dart';
import 'package:untitled1/app/resources/values_manager.dart';
import 'package:untitled1/movies/presentation/controller/movie_details_bloc.dart';

import '../../../../app/network_constance/enum.dart';
import '../../../../app/resources/constats.dart';
import '../../../../app/services/services_locator.dart';
import '../../../domain/entities/movie_details.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => sl<MovieDetailsBloc>()
        ..add(MovieSeeMoreDetails(id: id))
        ..add(MovieRecommendationEvent(id: id)),
      child: const Scaffold(
        body: MovieDetailContent(),
      ),
    );
  }
}

class MovieDetailContent extends StatelessWidget {
  const MovieDetailContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        switch (state.movieDetailsState) {
          case RequestState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case RequestState.success:
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              key: const Key('movieDetailScrollView'),
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: AppSize.s250,
                  flexibleSpace: FlexibleSpaceBar(
                    background: FadeIn(
                      duration:
                          const Duration(seconds: AppConstants.pageViewTimer),
                      child: ShaderMask(
                        shaderCallback: (rect) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black,
                              Colors.black,
                              Colors.transparent,
                            ],
                            stops: [0.0, 0.5, 1.0, 1.0],
                          ).createShader(
                            Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                          );
                        },
                        blendMode: BlendMode.dstIn,
                        child: CachedNetworkImage(
                          width: MediaQuery.of(context).size.width,
                          imageUrl: NetworkConstance.imageUrl(
                              state.movieDetails!.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: FadeInUp(
                    duration:
                        const Duration(seconds: AppConstants.pageViewTimer),
                    child: Padding(
                      padding: const EdgeInsets.all(AppSize.s16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.movieDetails!.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                      letterSpacing: 1.5,
                                      height: 1.5,
                                      fontSize: FontSize.s20)),
                          const SizedBox(height: AppSize.s8),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(AppPadding.p8),
                                decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Text(
                                  state.movieDetails!.releaseDate.split('-')[0],
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                              const SizedBox(width: AppSize.s16),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: AppSize.s18,
                                  ),
                                  const SizedBox(width: AppSize.s4),
                                  Text(
                                    (state.movieDetails!.voteAverage)
                                        .toStringAsFixed(1),
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  const SizedBox(width: AppSize.s4),
                                ],
                              ),
                              const SizedBox(width: AppSize.s16),
                              Text(
                                _showDuration(state.movieDetails!.movieTime),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSize.s18),
                          Text(
                            state.movieDetails!.overView,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            '${AppStrings.genres}: ${_showGenres(state.movieDetails!.genres)}',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                  sliver: SliverToBoxAdapter(
                    child: FadeInUp(
                      from: 20,
                      duration: const Duration(milliseconds: 500),
                      child: Text(AppStrings.moreLikeThis.toUpperCase(),
                          style: Theme.of(context).textTheme.titleMedium),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
                  sliver: _showRecommendations(),
                ),
              ],
            );
          case RequestState.error:
            return const Center(
              child: Text(AppStrings.noDataFound),
            );
        }
      },
    );
  }

  String _showGenres(List<Genres> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }

  Widget _showRecommendations() {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        return SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final recommendation = state.movieRecommendations[index];
              return FadeInUp(
                from: 20,
                duration: const Duration(seconds: AppConstants.pageViewTimer),
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.all(Radius.circular(AppSize.s4)),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDetailScreen(
                                    id: recommendation.id,
                                  )));
                    },
                    child: CachedNetworkImage(
                      imageUrl:
                          NetworkConstance.imageUrl(recommendation.image!),
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[850]!,
                        highlightColor: Colors.grey[800]!,
                        child: Container(
                          height: AppSize.s170,
                          width: AppSize.s100,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(AppSize.s8),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      height: AppSize.s170,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
            childCount: state.movieRecommendations.length,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: AppSize.s8,
            crossAxisSpacing: AppSize.s8,
            childAspectRatio: 0.8,
            crossAxisCount: 2,
          ),
        );
      },
    );
  }
}
