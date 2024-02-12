import 'package:bookly/Features/home/presentation/views/widgets/newest_books_list_view_loading_item.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NewestBooksLoadingListView extends StatelessWidget {
  const NewestBooksLoadingListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: .1,
      child: Shimmer.fromColors(
        baseColor: const Color.fromARGB(255, 212, 201, 201),
        highlightColor: Colors.white,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.separated(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const NewestBooksListViewLoadingItem();
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: 10)),
      ),
    );
  }
}
