import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/error/server_exception.dart';
import '../../domain/entities/uf.dart';
import '../../domain/repositories/uf_repository.dart';
import '../datasources/uf_datasource.dart';

class UfRepositoryImpl implements UfRepository {
  UfRepositoryImpl(this.dataSource) : assert(dataSource != null);

  final UfDataSource dataSource;

  @override
  Future<Either<Failure, List<Uf>>> findAll() async {
    try {
      return Right(await dataSource.findAll());
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
