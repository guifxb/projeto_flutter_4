import 'package:flutter/material.dart';

import '../data/model/movie_item.dart';
import 'movie_details_view.dart';

class CategoriesListWidget extends StatelessWidget {
  final List<List<MovieItem>> categories;
  final List<String> categoryNames;

  const CategoriesListWidget(
      {required this.categories, required this.categoryNames, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                categoryNames[index],
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 340,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories[index].length,
                itemBuilder: (context, innerIndex) {
                  final item = categories[index][innerIndex];
                  final heroTag = '$index-${item.posterPath}';

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetailsView(
                            movie: item,
                            heroTag: heroTag,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      width: 160,
                      child: Column(
                        children: [
                          Hero(
                            tag: heroTag,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6.0),
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w500${item.posterPath}',
                                fit: BoxFit.fill,
                                height: 250,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12.0),
                          Text(
                            item.title,
                            style: const TextStyle(fontSize: 16),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}