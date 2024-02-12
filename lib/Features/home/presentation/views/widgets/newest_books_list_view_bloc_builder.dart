import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/manager/newest_books_cubit/fetch_newest_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListViewBlocBuilder extends StatefulWidget {
  const NewestBooksListViewBlocBuilder({
    super.key,
  });

  @override
  State<NewestBooksListViewBlocBuilder> createState() =>
      _NewestBooksListViewBlocBuilderState();
}

class _NewestBooksListViewBlocBuilderState
    extends State<NewestBooksListViewBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchNewestBooksCubit, FetchNewestBooksState>(
      listener: (context, state) {
        if (state is FetchNewestBooksSuccess) {
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is FetchNewestBooksSuccess ||
            state is FetchNewestBooksPaginationLoading ||
            state is FetchNewestBooksPaginationFailure) {
          return NewestBooksListView(newestBooksList: books);
        } else if (state is FetchNewestBooksFailure) {
          return Text(state.errMessage);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
