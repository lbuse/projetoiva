import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/uf.dart';

abstract class UfRepository {
  Future<Either<Failure, List<Uf>>> findAll();
}
