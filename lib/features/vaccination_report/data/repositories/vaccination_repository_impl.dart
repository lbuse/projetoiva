import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/error/server_exception.dart';
import '../../domain/entities/vaccination.dart';
import '../../domain/repositories/vaccination_repository.dart';
import '../datasources/vaccination_datasource.dart';

class VaccinationRepositoryImpl implements VaccinationRepository {
  VaccinationRepositoryImpl(this.dataSource) : assert(dataSource != null);

  final VaccinationDataSource dataSource;

  @override
  Future<Either<Failure, List<Vaccination>>> findAll({String scrollId}) async {
    try {
      return Right(await dataSource.findAll(scrollId: scrollId));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        statusCode: e.statusCode,
        message: e.message,
      ));
    } on FormatException catch (e) {
      return Left(GeneralFailure(
        message: e.message,
      ));
    }
  }
}
