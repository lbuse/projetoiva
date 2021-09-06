import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/error/server_exception.dart';
import '../../domain/entities/city.dart';
import '../../domain/repositories/city_repository.dart';
import '../datasources/city_datasource.dart';

class CityRepositoryImpl implements CityRepository {
  CityRepositoryImpl(this.dataSource);

  final CityDataSource dataSource;

  @override
  Future<Either<Failure, List<City>>> findByUf(String uf) async {
    try {
      return Right(await dataSource.findByUf(uf));
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
