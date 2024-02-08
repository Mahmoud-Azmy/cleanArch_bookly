import 'package:bookly/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'custom_book_item.dart';

class SimilarBooksListview extends StatelessWidget {
  const SimilarBooksListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 25,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: GestureDetector(
                  onTap: (() {
                    GoRouter.of(context).push(AppRouter.kBookDetailsView);
                  }),
                  child: const CustomBookImage(
                    imageUrl:
                        'https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcRYT2_qpM81JX8FdDi53mc-ZNIGhwVGlDtG5uTuuHU9K6rTaRZqONIPL7tEiwLb8t4D4mBbt0-UL5ijZBU',
                  ),
                ));
          }),
    );
  }
}
