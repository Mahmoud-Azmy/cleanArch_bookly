import 'package:bookly/Features/home/domain/use_cases/fetch_relative_books_use_case.dart';
import 'package:bookly/Features/home/presentation/manager/cubit/fetch_relative_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchRelativeBooksCubit extends Cubit<FetchRelativeBooksState> {
  FetchRelativeBooksCubit(this.fetchRelativeBooksUseCase)
      : super(FetchRelativeBooksInitial());
  final FetchRelativeBooksUseCase fetchRelativeBooksUseCase;
  Future<void> fetchRelatievBooks(
      {int pageNumber = 0, String? category}) async {
    if (pageNumber == 0) {
      emit(FetchRelativeBooksLoading());
    } else {
      emit(FetchRelativeBooksPaginationLoading());
    }
    var result = await fetchRelativeBooksUseCase.call(pageNumber, category);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(FetchRelativeBooksFailure(failure.errorMessage));
      } else {
        emit(
          FetchRelativeBooksPaginationFailure(failure.errorMessage),
        );
      }
    }, (books) {
      emit(FetchRelativeBooksSuccess(books));
    });
  }
}
