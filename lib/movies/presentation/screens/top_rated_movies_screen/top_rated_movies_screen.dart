import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:untitled1/app/resources/values_manager.dart';
import 'package:untitled1/movies/presentation/controller/movie_bloc.dart';
import 'package:untitled1/movies/presentation/controller/movies_event.dart';

import '../../../../app/network_constance/enum.dart';
import '../../../../app/network_constance/network_constance.dart';
import '../../../../app/services/services_locator.dart';
import '../../controller/movie_states.dart';

class TopRatedMoviesScreen extends StatelessWidget {
  const TopRatedMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()..add(GetTopRatedMoviesEvent()),
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          print(state.topRatedMovies);

          switch (state.topRatedMoviesState) {
            case RequestState.loading:
              return const Center(child: CircularProgressIndicator());
            case RequestState.error:
              return const Text(' Error');
            case RequestState.success:
              return Scaffold(
                appBar: AppBar(
                  title: Text('gggggg',style: TextStyle(color: Colors.white),),
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                ),
                body: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListMoviesItem(
                      image: state.topRatedMovies[index].image,
                      title: state.topRatedMovies[index].title,
                      description: state.topRatedMovies[index].description,
                      releaseDate: state.topRatedMovies[index].releaseDate,
                      voteAverage: state.topRatedMovies[index].voteAverage,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return  Container(
                      height: AppSize.s18,
                      color: Colors.white10,
                    );
                  },
                  itemCount: state.topRatedMovies.length,
                ),
              );
          }
        },
      ),
    );
  }
}

class ListMoviesItem extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final String releaseDate;
  final double voteAverage;

  const ListMoviesItem(
      {super.key,
        required this.title,
        required this.image,
        required this.description,
        required this.releaseDate,
        required this.voteAverage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s170,
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s12),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            child: CachedNetworkImage(
              height: AppSize.s170,
              width: AppSize.s100,
              fit: BoxFit.cover,
              imageUrl: NetworkConstance.imageUrl(image),
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[850]!,
                highlightColor: Colors.grey[800]!,
                child: Container(
                  height: AppSize.s250,
                  width: AppSize.s100,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(AppSize.s8),
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(
            width: AppSize.s10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSize.s20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: AppSize.s10,
                  ),
                  Row(
                    children: [
                      Text(releaseDate.split('-_-')[0],
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(
                        width: AppSize.s25,
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: AppSize.s18,
                      ),
                      Text(voteAverage.toStringAsFixed(1),
                          style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
