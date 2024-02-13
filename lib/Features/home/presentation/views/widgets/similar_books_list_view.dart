import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/manager/cubit/fetch_relative_books_cubit.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'custom_book_item.dart';

class SimilarBooksListview extends StatefulWidget {
  const SimilarBooksListview({super.key, required this.books, this.category});
  final List<BookEntity> books;
  final String? category;
  @override
  State<SimilarBooksListview> createState() => _SimilarBooksListviewState();
}

class _SimilarBooksListviewState extends State<SimilarBooksListview> {
  late ScrollController scrollController;
  int nextPage = 1;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    var currentPosition = scrollController.position.pixels;
    var maxLength = scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.7 * maxLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<FetchRelativeBooksCubit>(context)
            .fetchRelatievBooks(
                pageNumber: nextPage++, category: widget.category);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          itemCount: widget.books.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: GestureDetector(
                  onTap: (() {
                    GoRouter.of(context).push(AppRouter.kBookDetailsView);
                  }),
                  child: CustomBookImage(
                    imageUrl: widget.books[index].image ?? '',
                  ),
                ));
          }),
    );
  }
}
