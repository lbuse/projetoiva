import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projetoiva/core/helpers/formatter.dart';

import '../../../../core/error/server_exception.dart';
import '../../domain/entities/bulletin_details.dart';
import '../../domain/entities/bulletin.dart';
import '../models/bulletin_details_model.dart';

abstract class BulletinDataSource {
  /// Requisita uma lista.
  ///
  /// Retorna uma lista de [BulletinDetails] com base nos parâmetros
  /// opcionais [Bulletin] e [page].
  ///
  /// Exemplo de chamada https://brasil.io/dataset/covid19/caso/?search=&date=&state=&city=&place_type=state&is_last=&city_ibge_code=&order_for_place=
  Future<List<BulletinDetails>> findAll({
    Bulletin bulletin,
    int? page,
  });
}

class BulletinDataSourceImpl implements BulletinDataSource {
  final http.Client _httpClient;
  final String _token;

  BulletinDataSourceImpl({
    http.Client? httpClient,
    String? token,
  })  : _httpClient = httpClient ?? http.Client(),
        _token = token ?? '';

  /// Requisita uma lista.
  ///
  /// Retorna uma lista de [BulletinDetails] com base nos parâmetros
  /// opcionais [Bulletin] e [page], em caso de falha da requisição
  /// uma [ServerException] será lançada e em caso de problema com a resposta,
  /// uma [FormatException] será lançada.
  ///
  /// Exemplo de chamada https://brasil.io/dataset/covid19/caso/?search=&date=&state=&city=&place_type=state&is_last=&city_ibge_code=&order_for_place=
  @override
  Future<List<BulletinDetails>> findAll({
    Bulletin bulletin = const Bulletin(),
    int? page,
  }) async {
    final placeTypeString = Bulletin.placeTypeToStringOrEmpty(
      bulletin.placeType,
    );
    final dateString = Bulletin.dateTimeToStringOrEmptyOrEmpty(bulletin.date);
    final String pageString = Formatters.valueToStringOrEmpty(page);

    print(
      'https://api.brasil.io/v1/dataset/covid19/caso/data/?page=$pageString&date=$dateString&state=${bulletin.stateToStringOrEmpty}&city=${bulletin.cityToStringOrEmpty}&place_type=$placeTypeString&is_last=${bulletin.isLastToStringOrEmpty}&city_ibge_code=${bulletin.cityIbgeCodeToStringOrEmpty}',
    );

    final response = await _httpClient.get(
      Uri.parse(
        'https://api.brasil.io/v1/dataset/covid19/caso/data/?page=$pageString&date=$dateString&state=${bulletin.stateToStringOrEmpty}&city=${bulletin.cityToStringOrEmpty}&place_type=$placeTypeString&is_last=${bulletin.isLastToStringOrEmpty}&city_ibge_code=${bulletin.cityIbgeCodeToStringOrEmpty}',
      ),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Token $_token',
      },
    );

    if (response.statusCode == 200) {
      return BulletinDetailsEnvelope.fromJson(
            json.decode(utf8.decode(response.bodyBytes)),
          ).bulletins ??
          [];
    } else if (response.statusCode == 400) {
      return [];
    } else {
      throw ServerException(
        statusCode: response.statusCode,
        message: utf8.decode(response.bodyBytes),
      );
    }
  }
}
