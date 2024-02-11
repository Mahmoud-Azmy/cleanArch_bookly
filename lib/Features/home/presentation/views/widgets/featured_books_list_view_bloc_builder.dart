import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/manager/featured_books_cubit/fetch_featured_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewBlocBuilder extends StatefulWidget {
  const FeaturedBooksListViewBlocBuilder({
    super.key,
  });

  @override
  State<FeaturedBooksListViewBlocBuilder> createState() =>
      _FeaturedBooksListViewBlocBuilderState();
}

class _FeaturedBooksListViewBlocBuilderState
    extends State<FeaturedBooksListViewBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchFeaturedBooksCubit, FetchFeaturedBooksState>(
        listener: (context, state) {
      if (state is FetchFeaturedBooksSuccess) books.addAll(state.books);
    }, builder: (context, state) {
      if (state is FetchFeaturedBooksFailure) {
        return Center(child: Text(state.errMessage));
      } else if (state is FetchFeaturedBooksSuccess ||
          state is FetchFeaturedBooksPaginationLoading ||
          state is FetchFeaturedBooksPaginationFailure) {
        return FeaturedBooksListView(books: books);
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
