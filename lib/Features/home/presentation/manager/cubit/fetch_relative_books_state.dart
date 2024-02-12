import 'package:bookly/Features/home/domain/entities/book_entity.dart';

abstract class FetchRelativeBooksState {}

class FetchRelativeBooksInitial extends FetchRelativeBooksState {}

class FetchRelativeBooksLoading extends FetchRelativeBooksState {}

class FetchRelativeBooksPaginationLoading extends FetchRelativeBooksState {}

class FetchRelativeBooksPaginationFailure extends FetchRelativeBooksState {
  final String errMessage;

  FetchRelativeBooksPaginationFailure(this.errMessage);
}

class FetchRelativeBooksFailure extends FetchRelativeBooksState {
  final String errMessage;

  FetchRelativeBooksFailure(this.errMessage);
}

class FetchRelativeBooksSuccess extends FetchRelativeBooksState {
  final List<BookEntity> books;

  FetchRelativeBooksSuccess(this.books);
}
