import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

/// Representa tipo de filtro de resultado na API
/// all = '' (vazio quando todos os tipos são utilizados)
/// city = 'city' resultado por cidade
/// state = 'state' resultado por estados
enum PlaceType {
  all,
  city,
  state,
}

class Bulletin {
  final DateTime date;
  final String state;
  final String city;
  @JsonKey(
    name: 'place_type',
    fromJson: stringToPlaceType,
    toJson: placeTypeToString,
  )
  final PlaceType placeType;
  final int confirmed;
  final int deaths;
  @JsonKey(name: 'is_last')
  final bool isLast;
  @JsonKey(name: 'estimated_population')
  final int estimatedPopulation;
  @JsonKey(name: 'estimated_population_2019')
  final int estimatedPopulation2019;
  @JsonKey(name: 'city_ibge_code')
  final String cityIbgeCode;
  @JsonKey(name: 'confirmed_per_100k_inhabitants')
  final double confirmedPer100kInhabitants;
  @JsonKey(name: 'death_rate')
  final double deathRate;
  @JsonKey(name: 'order_for_place')
  final int orderForPlace;

  Bulletin(
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
  );

  double get rateFormated => deathRate * 100;

  static String placeTypeToString(PlaceType value) {
    switch (value) {
      case PlaceType.city:
        return 'city';
      case PlaceType.state:
        return 'state';
      default:
        return '';
    }
  }

  static PlaceType stringToPlaceType(String value) {
    switch (value) {
      case 'city':
        return PlaceType.city;
      case 'state':
        return PlaceType.state;
      default:
        return PlaceType.all;
    }
  }

  /// Formata uma data para o formato 'yyyy-MM-dd'
  static String dateTimeToStringOrEmpty(DateTime value) {
    if (value == null) {
      return '';
    }

    try {
      return DateFormat('yyyy-MM-dd').format(value);
    } on FormatException {
      return '';
    }
  }
}
