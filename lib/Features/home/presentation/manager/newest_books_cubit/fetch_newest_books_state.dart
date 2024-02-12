part of 'fetch_newest_books_cubit.dart';

@immutable
abstract class FetchNewestBooksState {}

class FetchNewestBooksInitial extends FetchNewestBooksState {}

class FetchNewestBooksPaginationLoading extends FetchNewestBooksState {}

class FetchNewestBooksPaginationFailure extends FetchNewestBooksState {
  final String errMessage;

  FetchNewestBooksPaginationFailure(this.errMessage);
}

class FetchNewestBooksLoading extends FetchNewestBooksState {}

class FetchNewestBooksFailure extends FetchNewestBooksState {
  final String errMessage;

  FetchNewestBooksFailure(this.errMessage);
}

class FetchNewestBooksSuccess extends FetchNewestBooksState {
  final List<BookEntity> books;

  FetchNewestBooksSuccess(this.books);
}
