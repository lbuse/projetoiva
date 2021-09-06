import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/error/server_exception.dart';
import '../../../../core/helpers/extensions.dart';
import '../../domain/entities/vaccination.dart';
import '../models/vaccination_model.dart';

abstract class VaccinationDataSource {
  Future<List<Vaccination>> findAll({String? scrollId});
}

class VaccinationDataSourceImpl implements VaccinationDataSource {
  VaccinationDataSourceImpl({
    http.Client? httpClient,
    String username = 'imunizacao_public',
    String password = 'qlto5t&7r_@+#Tlstigi',
  })  : _httpClient = httpClient ?? http.Client(),
        _username = username,
        _password = password;

  final http.Client _httpClient;
  final String _username;
  final String _password;

  @override
  Future<List<Vaccination>> findAll({String? scrollId}) async {
    final uriPath = scrollId.isNotNullAndNotEmpty ? 'scroll' : '?scroll=1m';

    final response = await _httpClient.post(
      Uri.parse('https://imunizacao-es.saude.gov.br/_search/$uriPath'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Basic $_username:$_password',
      },
      body: scrollId != null && scrollId.isNotEmpty
          ? json.encode('{"scroll_id": "$scrollId","scroll": "1m"}')
          : null,
    );

    if (response.statusCode == 200) {
      Iterable i = VaccinationEnvelope.fromJson(
            json.decode(utf8.decode(response.bodyBytes)),
          ).data?.vaccinesApplied ??
          Iterable.empty();
      return List<VaccinationModel>.from(i.map((model) => model.data));
    } else {
      throw ServerException(
        statusCode: response.statusCode,
        message: response.body,
      );
    }
  }
}
