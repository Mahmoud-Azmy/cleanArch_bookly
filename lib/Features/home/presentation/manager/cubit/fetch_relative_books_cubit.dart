import 'package:bookly/Features/home/domain/use_cases/fetch_relative_books_use_case.dart';
import 'package:bookly/Features/home/presentation/manager/cubit/fetch_relative_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchRelativeBooksCubit extends Cubit<FetchRelativeBooksState> {
  FetchRelativeBooksCubit(this.fetchRelativeBooksUseCase)
      : super(FetchRelativeBooksInitial());
  final FetchRelativeBooksUseCase fetchRelativeBooksUseCase;
  Future<void> fetchRelatievBooks({int pageNumber = 0}) async {}
}
