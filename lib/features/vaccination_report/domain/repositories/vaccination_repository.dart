import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/vaccination.dart';

abstract class VaccinationRepository {
  Future<Either<Failure, List<Vaccination>>> findAll({String scrollId});
}
