import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/bulletin.dart';

abstract class BulletinRepository {
  Future<Either<Failure, List<Bulletin>>> findAll({
    int page,
    DateTime date,
    PlaceType placeType,
    bool isLast,
    String state,
    String city,
    String cityIbgeCode,
  });
}
