import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/city.dart';

abstract class CityRepository {
  Future<Either<Failure, List<City>>> findByUf(String uf);
}
