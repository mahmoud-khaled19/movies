import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class BaseUseCase<T, Parameter> {
  Future<Either<Failure, T>> call(Parameter parameter);
}

class NoParameter {
  const NoParameter();
}
