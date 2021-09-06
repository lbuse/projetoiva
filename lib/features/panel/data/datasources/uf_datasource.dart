import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/error/server_exception.dart';
import '../../domain/entities/uf.dart';
import '../models/uf_model.dart';

abstract class UfDataSource {
  Future<List<Uf>> findAll();
}

class UfDataSourceImpl implements UfDataSource {
  UfDataSourceImpl({
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  @override
  Future<List<Uf>> findAll() async {
    final response = await _httpClient.get(
      Uri.parse('https://servicodados.ibge.gov.br/api/v1/localidades/estados'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      Iterable i = json.decode(response.body);
      return List<UfModel>.from(i.map((model) => UfModel.fromJson(model)));
    } else {
      throw ServerException(
        statusCode: response.statusCode,
        message: response.reasonPhrase,
      );
    }
  }
}
