import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/error/server_exception.dart';
import '../../domain/entities/bulletin.dart';
import '../../domain/repositories/bulletin_repository.dart';
import '../datasources/bulletin_data_source.dart';

class BulletinRepositoryImpl implements BulletinRepository {
  final BulletinDataSource _dataSource;

  BulletinRepositoryImpl(
    BulletinDataSource dataSource,
  ) : _dataSource = dataSource;

  @override
  Future<Either<Failure, List<Bulletin>>> findAll({
    int? page,
    DateTime? date,
    PlaceType? placeType,
    bool? isLast,
    String? state,
    String? city,
    String? cityIbgeCode,
  }) async {
    try {
      return Right(await _dataSource.findAll(
        page: page,
        date: date,
        placeType: placeType,
        isLast: isLast,
        state: state,
        city: city,
        cityIbgeCode: cityIbgeCode,
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
    }
  }
}
