import 'package:dartz/dartz.dart';

import '../error/failures.dart';

/// Contrato para que uma ação implemente ao menos a [call]
/// como método padrão.
abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Contrato para casos de uso que não possuem parâmetos
class NoParams {}
