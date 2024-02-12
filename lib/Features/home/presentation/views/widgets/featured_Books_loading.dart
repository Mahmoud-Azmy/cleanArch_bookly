import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class FeaturedBooksloading extends StatelessWidget {
  const FeaturedBooksloading({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: .1,
      child: Shimmer.fromColors(
          baseColor: const Color.fromARGB(255, 212, 201, 201),
          highlightColor: Colors.white,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .3,
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
                      height: MediaQuery.of(context).size.height * .3,
                      width: 170,
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
