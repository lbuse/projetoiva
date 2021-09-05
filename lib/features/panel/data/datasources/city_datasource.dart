import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/error/server_exception.dart';
import '../../domain/entities/city.dart';
import '../models/city_model.dart';

abstract class CityDataSource {
  Future<List<City>> findByUf(String uf);
}

class CityDataSourceImpl implements CityDataSource {
  CityDataSourceImpl({
    http.Client httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  @override
  Future<List<City>> findByUf(String uf) async {
    final response = await _httpClient.get(
      Uri.parse(
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados/$uf/municipios',
      ),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      Iterable i = json.decode(response.body);
      return List<CityModel>.from(i.map((model) => CityModel.fromJson(model)));
    } else {
      throw ServerException(
        statusCode: response.statusCode,
        message: response.body,
      );
    }
  }
}
