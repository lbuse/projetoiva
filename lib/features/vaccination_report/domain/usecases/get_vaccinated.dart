import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/vaccination.dart';
import '../repositories/vaccination_repository.dart';

class GetVaccinated implements Usecase<List<Vaccination>, Params> {
  GetVaccinated(this.repository);

  final VaccinationRepository repository;

  @override
  Future<Either<Failure, List<Vaccination>>> call(Params params) async {
    final response = await repository.findAll(scrollId: params.scrollId);

    return response.fold(
      (failure) => Left(failure),
      (list) => Right(list),
    );
  }
}

class Params {
  final String? scrollId;

  const Params({
    this.scrollId,
  });
}
