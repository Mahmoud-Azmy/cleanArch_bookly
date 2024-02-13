import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/manager/cubit/fetch_relative_books_cubit.dart';
import 'package:bookly/Features/home/presentation/manager/cubit/fetch_relative_books_state.dart';
import 'package:bookly/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:bookly/Features/home/presentation/views/widgets/similar_books_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListViewBlocBuilder extends StatefulWidget {
  const SimilarBooksListViewBlocBuilder({
    super.key,
    this.category,
  });
  final String? category;
  @override
  State<SimilarBooksListViewBlocBuilder> createState() =>
      _SimilarBooksListViewBlocBuilderState();
}

class _SimilarBooksListViewBlocBuilderState
    extends State<SimilarBooksListViewBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchRelativeBooksCubit, FetchRelativeBooksState>(
      listener: (context, state) {
        if (state is FetchRelativeBooksSuccess) books.addAll(books);
      },
      builder: (context, state) {
        if (state is FetchRelativeBooksSuccess) {
          return SimilarBooksListview(
            books: books,
          );
        } else if (state is FetchRelativeBooksFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else {
          return const SimilarBooksLoading();
        }
      },
    );
  }
}
