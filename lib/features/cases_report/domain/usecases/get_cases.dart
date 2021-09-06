import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/bulletin.dart';
import '../repositories/bulletin_repository.dart';

class GetCases implements Usecase<List<Bulletin>, Params> {
  GetCases(this.repository);

  final BulletinRepository repository;

  @override
  Future<Either<Failure, List<Bulletin>>> call(Params params) async {
    final response = await repository.findAll(
      page: params.page,
      date: params.date,
      placeType: params.placeType,
      isLast: params.isLast,
      state: params.state,
      city: params.city,
      cityIbgeCode: params.cityIbgeCode,
    );

    return response.fold(
      (failure) => Left(failure),
      (list) => Right(list),
    );
  }
}

class Params {
  final int? page;
  final DateTime? date;
  final PlaceType placeType;
  final bool? isLast;
  final String? state;
  final String? city;
  final String? cityIbgeCode;

  Params({
    this.page,
    this.date,
    this.placeType = PlaceType.all,
    this.isLast,
    this.state,
    this.city,
    this.cityIbgeCode,
  });
}
