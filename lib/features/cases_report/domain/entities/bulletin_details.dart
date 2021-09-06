import 'package:json_annotation/json_annotation.dart';

import 'bulletin.dart';

/// Define uma entidade do boletim de casos e óbitos com parâmetros que
/// são retornados de uma requisição na API.
class BulletinDetails extends Bulletin {
  final int? confirmed;
  final int? deaths;
  @JsonKey(name: 'estimated_population')
  final int? estimatedPopulation;
  @JsonKey(name: 'estimated_population_2019')
  final int? estimatedPopulation2019;
  @JsonKey(name: 'confirmed_per_100k_inhabitants')
  final double? confirmedPer100kInhabitants;
  @JsonKey(name: 'death_rate')
  final double? deathRate;

  const BulletinDetails(
    DateTime? date,
    String? state,
    String? city,
    PlaceType? placeType,
    this.confirmed,
    this.deaths,
    bool? isLast,
    this.estimatedPopulation,
    this.estimatedPopulation2019,
    String? cityIbgeCode,
    this.confirmedPer100kInhabitants,
    this.deathRate,
    int? orderForPlace,
  ) : super(
          date: date,
          state: state,
          city: city,
          placeType: placeType,
          isLast: isLast,
          cityIbgeCode: cityIbgeCode,
          orderForPlace: orderForPlace,
        );

  double get rateFormated => deathRate! * 100;
}
