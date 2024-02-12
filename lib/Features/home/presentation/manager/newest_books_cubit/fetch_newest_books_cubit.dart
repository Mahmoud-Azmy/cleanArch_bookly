import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'fetch_newest_books_state.dart';

class FetchNewestBooksCubit extends Cubit<FetchNewestBooksState> {
  FetchNewestBooksCubit(this.fetchNewestBooksUseCase)
      : super(FetchNewestBooksInitial());
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FetchNewestBooksLoading());
    } else {
      emit(FetchNewestBooksPaginationLoading());
    }
    var result = await fetchNewestBooksUseCase.call(pageNumber);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(
          FetchNewestBooksFailure(failure.errorMessage),
        );
      } else {
        emit(FetchNewestBooksPaginationFailure(failure.errorMessage));
      }
    }, (books) {
      emit(FetchNewestBooksSuccess(books));
    });
  }
}
