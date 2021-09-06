import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/uf.dart';
import '../repositories/uf_repository.dart';

class GetUfs implements Usecase<List<Uf>, NoParams> {
  GetUfs(this.repository);

  final UfRepository repository;

  @override
  Future<Either<Failure, List<Uf>>> call(NoParams params) async {
    final response = await repository.findAll();

    return response.fold(
      (failure) => Left(failure),
      (list) {
        final List<Uf> ufs = [];

        for (final uf in list) {
          if (uf.isValid) {
            ufs.add(uf);
          }
        }

        return Right(ufs);
      },
    );
  }
}
