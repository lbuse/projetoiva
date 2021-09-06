import 'package:dartz/dartz.dart';
import '../entities/bulletin_details.dart';
import '../entities/bulletin.dart';

import '../../../../core/error/failures.dart';

/// Repositório com operações destinadas a fontes de dados de casos e óbitos.
abstract class BulletinRepository {
  /// Requisita uma lista.
  ///
  /// Retorna uma lista de [BulletinDetails] com base nos parâmetros opcionais [Bulletin] e [page], ou em caso de problema, uma [Failure] é retornada.
  Future<Either<Failure, List<BulletinDetails>>> findAll({
    Bulletin bulletin,
    int? page,
  });
}
