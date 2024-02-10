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
    emit(FetchFeaturedBooksLoading());
    var result = await fetchFeaturedBooksUseCase.call(pageNumber);
    result.fold((failuer) {
      emit(FetchFeaturedBooksFailure(failuer.errorMessage));
    }, (books) {
      emit(FetchFeaturedBooksSuccess(books));
    });
  }
}
