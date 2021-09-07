import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/bulletin.dart';
import '../entities/bulletin_details.dart';
import '../repositories/bulletin_repository.dart';

/// Obtem casos e óbitos com opções de filtragem.
class GetCases implements Usecase<List<BulletinDetails>, Params> {
  GetCases(this.repository);

  final BulletinRepository repository;

  @override
  Future<Either<Failure, List<BulletinDetails>>> call(Params params) async {
    final response = await repository.findAll(
      bulletin: params.toBulletin(),
      page: params.page,
    );

    return response.fold(
      (failure) => Left(failure),
      (list) => Right(list),
    );
  }
}

/// Parâmetros exigidos pelo caso de uso para executar a operação desejada.
///
/// Os parâmetros especificados são [page] para consultar mais
/// resultado paginados pela fonte de dados, o [date] para obter resultads
/// de uma data especifica, [PlaceType] que determina a forma de agrupamento
/// do dados, o [isLast] que indica se apenas os registros atualizados devem
/// ser retornados, o [state] que filtra o estado desejado, o [city] que
/// filtra uma cidade desejada por nome e o [cityIbgeCode] que filtra uma
/// cidade através do código IBGE dela.
class Params {
  final int? page;
  final DateTime? date;
  final PlaceType? placeType;
  final bool? isLast;
  final String? state;
  final String? city;
  final int? cityIbgeCode;

  Params({
    this.page,
    this.date,
    this.placeType,
    this.isLast,
    this.state,
    this.city,
    this.cityIbgeCode,
  });

  Bulletin toBulletin() {
    return Bulletin(
      date: date,
      placeType: placeType,
      isLast: isLast,
      state: state,
      city: city,
      cityIbgeCode: cityIbgeCode?.toString(),
    );
  }
}
