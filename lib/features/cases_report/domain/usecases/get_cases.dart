import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/bulletin.dart';
import '../repositories/bulletin_repository.dart';

/// Obtem casos e óbitos com opções de filtragem.
class GetCases implements Usecase<List<BulletinReturned>, Params> {
  GetCases(this.repository);

  final BulletinRepository repository;

  @override
  Future<Either<Failure, List<BulletinReturned>>> call(Params params) async {
    final response = await repository.findAll(
      bulletin: params.toBulletin(),
      page: params.page,
    );

    return response.fold(
      (failure) => Left(failure),
      (bulletins) {
        final tempList = List.of(bulletins);
        tempList.removeWhere((bulletin) => !bulletin.isValid);

        final list = tempList
            .map((b) => BulletinReturned(
                  date: b.date,
                  state: b.state,
                  city: b.city,
                  placeType: b.placeType,
                  confirmed: b.confirmed,
                  deaths: b.deaths,
                  isLast: b.isLast,
                  estimatedPopulation: b.estimatedPopulation,
                  estimatedPopulation2019: b.estimatedPopulation2019,
                  cityIbgeCode: b.cityIbgeCode,
                  confirmedPer100kInhabitants: b.confirmedPer100kInhabitants,
                  deathRate: b.deathRate,
                  orderForPlace: b.orderForPlace,
                ))
            .toList();

        return Right(list);
      },
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
  final String? cityIbgeCode;

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
      cityIbgeCode: cityIbgeCode,
    );
  }
}

/// Objeto representando o resultado retornado pelo [GetCases].
///
/// É encorajado o uso desse objeto na ViewModel ao invés da entidade, pois caso
/// a entidade mude, a ViewModel não sofrerá com problemas inesperado.
class BulletinReturned {
  final DateTime? date;
  final String? state;
  final String? city;
  final PlaceType? placeType;
  final int? confirmed;
  final int? deaths;
  final bool? isLast;
  final int? estimatedPopulation;
  final int? estimatedPopulation2019;
  final String? cityIbgeCode;
  final double? confirmedPer100kInhabitants;
  final double? deathRate;
  final int? orderForPlace;

  const BulletinReturned({
    this.date,
    this.state,
    this.city,
    this.placeType,
    this.confirmed,
    this.deaths,
    this.isLast,
    this.estimatedPopulation,
    this.estimatedPopulation2019,
    this.cityIbgeCode,
    this.confirmedPer100kInhabitants,
    this.deathRate,
    this.orderForPlace,
  });

  double get rateFormated => deathRate! * 100;
}
