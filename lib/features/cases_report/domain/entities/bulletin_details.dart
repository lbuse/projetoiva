import 'package:json_annotation/json_annotation.dart';

import 'bulletin.dart';

/// Define uma entidade do boletim de casos e óbitos com parâmetros que
/// são retornados de uma requisição na API.
class BulletinDetails {
  final DateTime? date;
  final String? state;
  final String? city;
  @JsonKey(
    name: 'place_type',
    fromJson: Bulletin.stringToPlaceType,
    toJson: Bulletin.placeTypeToStringOrEmpty,
  )
  final PlaceType? placeType;
  final int? confirmed;
  final int? deaths;
  @JsonKey(name: 'is_last')
  final bool? isLast;
  @JsonKey(name: 'estimated_population')
  final int? estimatedPopulation;
  @JsonKey(name: 'estimated_population_2019')
  final int? estimatedPopulation2019;
  @JsonKey(name: 'city_ibge_code')
  final String? cityIbgeCode;
  @JsonKey(name: 'confirmed_per_100k_inhabitants')
  final double? confirmedPer100kInhabitants;
  @JsonKey(name: 'death_rate')
  final double? deathRate;
  @JsonKey(name: 'order_for_place')
  final int? orderForPlace;

  const BulletinDetails({
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

  bool get isDateValid => date != null;
  bool get isStateValid => state != null && state!.isNotEmpty;
  bool get isCityValid => city != null && city!.isNotEmpty;
  bool get isPlaceTypeValid => placeType != null;
  bool get isConfirmedValid => confirmed != null && confirmed! >= 0;
  bool get isDeathsValid => deaths != null && deaths! >= 0;
  bool get isLastValid => isLast != null;
  bool get isEstimatedPopulationValid =>
      estimatedPopulation != null && estimatedPopulation! >= 0;
  bool get isEstimatedPopulation2019Valid =>
      estimatedPopulation2019 != null && estimatedPopulation2019! >= 0;
  bool get isCityIbgeCode => cityIbgeCode != null && cityIbgeCode!.isNotEmpty;
  bool get isConfirmedPer100kInhabitantsValid =>
      confirmedPer100kInhabitants != null && confirmedPer100kInhabitants! >= 0;
  bool get isDeathRateValid => deathRate != null;
  bool get isOrderForPlaceValid => orderForPlace != null && orderForPlace! >= 0;
  bool get isValid =>
      isDateValid &&
      (isStateValid || isCityValid) &&
      isConfirmedValid &&
      isDeathsValid;
}
