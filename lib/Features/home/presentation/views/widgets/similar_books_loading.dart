import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SimilarBooksLoading extends StatelessWidget {
  const SimilarBooksLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: .1,
      child: Shimmer.fromColors(
          baseColor: const Color.fromARGB(255, 212, 201, 201),
          highlightColor: Colors.white,
          child: SizedBox(
            height: 140,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: 120,
                      width: 90,
                      color: Colors.red,
                    ),
                  ),
                );
              },
            ),
          )),
    );
  }
}
