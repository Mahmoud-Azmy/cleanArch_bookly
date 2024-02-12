import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchRelativeBooksUseCase extends UseCase<List<BookEntity>, int, String> {
  final HomeRepo homeRepo;

  FetchRelativeBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call(
      [int parameter = 0, String? parameter2]) async {
    return await homeRepo.fetchRelativeBooks(
        category: parameter2, pageNumber: parameter);
  }
}
