import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/error/server_exception.dart';
import '../../../../core/helpers/formatter.dart';
import '../../domain/entities/bulletin.dart';
import '../models/bulletin_model.dart';

abstract class BulletinDataSource {
  /// Consulta os casos por estado com paginação [page]
  /// Exemplo de chamada https://brasil.io/dataset/covid19/caso/?search=&date=&state=&city=&place_type=state&is_last=&city_ibge_code=&order_for_place=
  Future<List<Bulletin>> findAll({
    int page,
    DateTime date,
    PlaceType placeType,
    bool isLast,
    String state,
    String city,
    String cityIbgeCode,
  });
}

class BulletinDataSourceImpl implements BulletinDataSource {
  final http.Client _httpClient;
  final String _token;

  BulletinDataSourceImpl({
    http.Client httpClient,
    String token,
  })  : _httpClient = httpClient ?? http.Client(),
        _token = token ?? '';

  @override
  Future<List<Bulletin>> findAll({
    int page,
    DateTime date,
    PlaceType placeType,
    bool isLast,
    String state = '',
    String city = '',
    String cityIbgeCode = '',
  }) async {
    // https://brasil.io/dataset/covid19/caso/?search=&date=&state=&city=&place_type=state&is_last=&city_ibge_code=&order_for_place=

    final placeTypeString = Bulletin.placeTypeToString(placeType);
    final dateString = Bulletin.dateTimeToStringOrEmpty(date);
    final isLastString = Formatters.valueToEmptyStringOrNull(isLast);
    state = Formatters.valueToEmptyStringOrNull(state);
    city = Formatters.valueToEmptyStringOrNull(city);
    cityIbgeCode = Formatters.valueToEmptyStringOrNull(cityIbgeCode);

    // TODO remover print
    print(
      'https://api.brasil.io/v1/dataset/covid19/caso/data/?page=$page&date=$dateString&state=$state&city=$city&place_type=$placeTypeString&is_last=$isLastString&city_ibge_code=$cityIbgeCode',
    );

    final response = await _httpClient.get(
      Uri.parse(
        'https://api.brasil.io/v1/dataset/covid19/caso/data/?page=$page&date=$dateString&state=$state&city=$city&place_type=$placeTypeString&is_last=$isLastString&city_ibge_code=$cityIbgeCode',
      ),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Token $_token',
      },
    );

    print(response.statusCode);

    if (response.statusCode == 200) {
      return BulletinEnvelope.fromJson(
            json.decode(utf8.decode(response.bodyBytes)),
          )?.bulletins ??
          [];
    } else {
      throw ServerException(
        statusCode: response.statusCode,
        message: utf8.decode(response.bodyBytes),
      );
    }
  }
}
