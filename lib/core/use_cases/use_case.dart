import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, paramerter, parameter2> {
  Future<Either<Failure, Type>> call(
      [paramerter parameter, parameter2 parameter2]);
}

class NoParameter {}
