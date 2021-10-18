import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/error/server_exception.dart';
import '../../domain/entities/bulletin_details.dart';
import '../../domain/entities/bulletin.dart';
import '../../domain/repositories/bulletin_repository.dart';
import '../datasources/bulletin_data_source.dart';

class BulletinRepositoryImpl implements BulletinRepository {
  final BulletinDataSource _dataSource;

  BulletinRepositoryImpl(
    BulletinDataSource dataSource,
  ) : _dataSource = dataSource;

  @override
  Future<Either<Failure, List<BulletinDetails>>> findAll({
    Bulletin bulletin = const Bulletin(),
    int? page,
  }) async {
    try {
      return Right(await _dataSource.findAll(
        bulletin: bulletin,
        page: page,
      ));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        statusCode: e.statusCode,
        message: e.message,
      ));
    } on FormatException catch (e) {
      return Left(GeneralFailure(
        message: e.message,
      ));
    } on Exception {
      return const Left(GeneralFailure(
        message: 'Erro desconhecido',
      ));
    }
  }
}
