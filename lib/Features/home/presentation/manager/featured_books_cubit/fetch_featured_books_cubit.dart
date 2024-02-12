import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'fetch_featured_books_state.dart';

class FetchFeaturedBooksCubit extends Cubit<FetchFeaturedBooksState> {
  FetchFeaturedBooksCubit(this.fetchFeaturedBooksUseCase)
      : super(FetchFeaturedBooksInitial());
  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;
  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FetchFeaturedBooksLoading());
    } else {
      emit(FetchFeaturedBooksPaginationLoading());
    }
    var result = await fetchFeaturedBooksUseCase.call(pageNumber);
    result.fold((failuer) {
      if (pageNumber == 0) {
        emit(FetchFeaturedBooksFailure(failuer.errorMessage));
      } else {
        emit(
          FetchFeaturedBooksPaginationFailure(failuer.errorMessage),
        );
      }
    }, (books) {
      emit(FetchFeaturedBooksSuccess(books));
    });
  }
}
