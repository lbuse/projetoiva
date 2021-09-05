import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/city.dart';
import '../repositories/city_repository.dart';

class GetCitiesByUfs implements Usecase<List<City>, Params> {
  GetCitiesByUfs(
    this.repository,
  ) : assert(repository != null);

  final CityRepository repository;

  @override
  Future<Either<Failure, List<City>>> call(Params params) async {
    final response = await repository.findByUf(params.uf);

    return response.fold(
      (failure) => Left(failure),
      (list) {
        final List<City> cities = [];

        for (final city in list) {
          if (city.isValid) {
            cities.add(city);
          }
        }

        return Right(cities);
      },
    );
  }
}

class Params {
  final String uf;

  Params(this.uf) : assert(uf != null);
}
