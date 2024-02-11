part of 'fetch_featured_books_cubit.dart';

@immutable
abstract class FetchFeaturedBooksState {}

class FetchFeaturedBooksInitial extends FetchFeaturedBooksState {}

class FetchFeaturedBooksLoading extends FetchFeaturedBooksState {}

class FetchFeaturedBooksPaginationLoading extends FetchFeaturedBooksState {}

class FetchFeaturedBooksPaginationFailure extends FetchFeaturedBooksState {
  final String errMessage;

  FetchFeaturedBooksPaginationFailure(this.errMessage);
}

class FetchFeaturedBooksFailure extends FetchFeaturedBooksState {
  final String errMessage;

  FetchFeaturedBooksFailure(this.errMessage);
}

class FetchFeaturedBooksSuccess extends FetchFeaturedBooksState {
  final List<BookEntity> books;

  FetchFeaturedBooksSuccess(this.books);
}
