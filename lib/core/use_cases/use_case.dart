import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, paramerter> {
  Future<Either<Failure, Type>> call([paramerter parameter]);
}

class NoParameter {}
