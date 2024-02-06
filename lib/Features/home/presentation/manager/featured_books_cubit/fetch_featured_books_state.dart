part of 'fetch_featured_books_cubit.dart';

@immutable
abstract class FetchFeaturedBooksState {}

class FetchFeaturedBooksInitial extends FetchFeaturedBooksState {}

class FetchFeaturedBooksLoading extends FetchFeaturedBooksState {}

class FetchFeaturedBooksFailure extends FetchFeaturedBooksState {
  final String errMessage;

  FetchFeaturedBooksFailure(this.errMessage);
}

class FetchFeaturedBooksSuccess extends FetchFeaturedBooksState {
  final List<BookEntity> books;

  FetchFeaturedBooksSuccess(this.books);
}
