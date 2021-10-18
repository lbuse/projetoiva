import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:projetoiva/core/helpers/formatter.dart';

/// Representa tipo de filtro de resultado na API
/// all = '' (vazio quando todos os tipos são utilizados)
/// city = 'city' resultado por cidade
/// state = 'state' resultado por estados
enum PlaceType {
  @JsonValue('')
  all,
  @JsonValue('city')
  city,
  @JsonValue('state')
  state,
}

/// Define uma entidade do boletim de casos e óbitos com parâmetros que
/// podem ser utilizados em uma requisição da API como também no retorna
/// de uma requisição.
class Bulletin {
  final DateTime? date;
  final String? state;
  final String? city;
  @JsonKey(name: 'place_type')
  final PlaceType? placeType;
  @JsonKey(name: 'is_last')
  final bool? isLast;
  @JsonKey(name: 'city_ibge_code')
  final String? cityIbgeCode;
  @JsonKey(name: 'order_for_place')
  final int? orderForPlace;

  const Bulletin({
    this.date,
    this.state,
    this.city,
    this.placeType,
    this.isLast,
    this.cityIbgeCode,
    this.orderForPlace,
  });

  /// Converte `bool` para `String` e em caso de nulo, uma `String` vazia
  /// é retornada.
  ///
  /// Util para métodos que API com parâmetros que aceitam o valor vazio.
  String get isLastToStringOrEmpty => Formatters.valueToStringOrEmpty(isLast);

  /// Em caso de nulo, uma `String` vazia é retornada.
  ///
  /// Util para métodos que API com parâmetros que aceitam o valor vazio.
  String get stateToStringOrEmpty => Formatters.valueToStringOrEmpty(state);

  /// Em caso de nulo, uma `String` vazia é retornada.
  ///
  /// Util para métodos que API com parâmetros que aceitam o valor vazio.
  String get cityToStringOrEmpty => Formatters.valueToStringOrEmpty(city);

  /// Em caso de nulo, uma `String` vazia é retornada.
  ///
  /// Util para métodos que API com parâmetros que aceitam o valor vazio.
  String get cityIbgeCodeToStringOrEmpty =>
      Formatters.valueToStringOrEmpty(cityIbgeCode);

  /// Converte `enum` para `String` e em caso de um tipo não identificado,
  /// uma `String` vazia é retornada.
  ///
  /// Util para métodos que API com parâmetros que aceitam o valor vazio.
  static String placeTypeToStringOrEmpty(PlaceType? value) {
    switch (value) {
      case PlaceType.city:
        return 'city';
      case PlaceType.state:
        return 'state';
      default:
        return '';
    }
  }

  static PlaceType stringToPlaceType(String? value) {
    switch (value) {
      case 'city':
        return PlaceType.city;
      case 'state':
        return PlaceType.state;
      default:
        return PlaceType.all;
    }
  }

  ///  Formata um `DateTime` para o formato 'yyyy-MM-dd' e retorna um `String`,
  ///  em caso de nulo, uma `String` vazia é retornada.
  ///
  /// Util para métodos que API com parâmetros que aceitam o valor vazio.
  static String dateTimeToStringOrEmptyOrEmpty(DateTime? value) {
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
