import 'package:bookly/Features/home/presentation/manager/newest_books_cubit/fetch_newest_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListViewBlocBuilder extends StatelessWidget {
  const NewestBooksListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchNewestBooksCubit, FetchNewestBooksState>(
      builder: (context, state) {
        if (state is FetchNewestBooksSuccess) {
          return NewestBooksListView(newestBooksList: state.books);
        } else if (state is FetchNewestBooksFailure) {
          return Text(state.errMessage);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
