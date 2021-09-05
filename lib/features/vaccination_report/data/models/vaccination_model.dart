import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/vaccination.dart';

part 'vaccination_model.g.dart';

@JsonSerializable(createToJson: false)
class VaccinationEnvelope {
  @JsonKey(name: '_scroll_id')
  final String scrollId;
  @JsonKey(name: 'hits')
  final SystemRecords data;

  const VaccinationEnvelope(this.scrollId, this.data);

  factory VaccinationEnvelope.fromJson(Map<String, dynamic> json) =>
      _$VaccinationEnvelopeFromJson(json);
}

@JsonSerializable(createToJson: false)
class SystemRecords {
  @JsonKey(name: 'hits')
  final List<DataSource> vaccinesApplied;

  SystemRecords(this.vaccinesApplied);

  factory SystemRecords.fromJson(Map<String, dynamic> json) =>
      _$SystemRecordsFromJson(json);
}

@JsonSerializable(createToJson: false)
class DataSource {
  @JsonKey(name: '_source')
  final VaccinationModel data;

  const DataSource(this.data);

  factory DataSource.fromJson(Map<String, dynamic> json) =>
      _$DataSourceFromJson(json);
}

@JsonSerializable(createToJson: false)
class VaccinationModel extends Vaccination {
  const VaccinationModel({
    String pacienteEnderecoCoIbgeMunicipio,
    String documentId,
    String dataImportacaoRnds,
    String sistemaOrigem,
    String version,
    String estabelecimentoRazaoSocial,
    String pacienteNacionalidadeEnumNacionalidade,
    String timestamp,
    String pacienteEnderecoCoPais,
    String vacinaGrupoAtendimentoNome,
    String vacinaGrupoAtendimentoCodigo,
    String vacinaCategoriaCodigo,
    String vacinaDescricaoDose,
    String vacinaCategoriaNome,
    String vacinaLote,
    String pacienteEnumSexoBiologico,
    String pacienteEnderecoNmMunicipio,
    String pacienteEnderecoUf,
    String pacienteEnderecoNmPais,
    String vacinaNome,
    DateTime dtDeleted,
    String pacienteRacaCorValor,
    String pacienteId,
    String estabelecimentoValor,
    String pacienteDataNascimento,
    String vacinaFabricanteNome,
    String vacinaDataAplicacao,
    String pacienteEnderecoCep,
    String estabelecimentoMunicipioNome,
    String estabelecimentoMunicipioCodigo,
    String status,
    String estabelecimentoUf,
    String idSistemaOrigem,
    int pacienteIdade,
    String vacinaFabricanteReferencia,
    String vacinaCodigo,
    String pacienteRacaCorCodigo,
    String redshift,
    String estalecimentoNoFantasia,
  }) : super(
          pacienteEnderecoCoIbgeMunicipio: pacienteEnderecoCoIbgeMunicipio,
          documentId: documentId,
          dataImportacaoRnds: dataImportacaoRnds,
          sistemaOrigem: sistemaOrigem,
          version: version,
          estabelecimentoRazaoSocial: estabelecimentoRazaoSocial,
          pacienteNacionalidadeEnumNacionalidade:
              pacienteNacionalidadeEnumNacionalidade,
          timestamp: timestamp,
          pacienteEnderecoCoPais: pacienteEnderecoCoPais,
          vacinaGrupoAtendimentoNome: vacinaGrupoAtendimentoNome,
          vacinaGrupoAtendimentoCodigo: vacinaGrupoAtendimentoCodigo,
          vacinaCategoriaCodigo: vacinaCategoriaCodigo,
          vacinaDescricaoDose: vacinaDescricaoDose,
          vacinaCategoriaNome: vacinaCategoriaNome,
          vacinaLote: vacinaLote,
          pacienteEnumSexoBiologico: pacienteEnumSexoBiologico,
          pacienteEnderecoNmMunicipio: pacienteEnderecoNmMunicipio,
          pacienteEnderecoUf: pacienteEnderecoUf,
          pacienteEnderecoNmPais: pacienteEnderecoNmPais,
          vacinaNome: vacinaNome,
          dtDeleted: dtDeleted,
          pacienteRacaCorValor: pacienteRacaCorValor,
          pacienteId: pacienteId,
          estabelecimentoValor: estabelecimentoValor,
          pacienteDataNascimento: pacienteDataNascimento,
          vacinaFabricanteNome: vacinaFabricanteNome,
          vacinaDataAplicacao: vacinaDataAplicacao,
          pacienteEnderecoCep: pacienteEnderecoCep,
          estabelecimentoMunicipioNome: estabelecimentoMunicipioNome,
          estabelecimentoMunicipioCodigo: estabelecimentoMunicipioCodigo,
          status: status,
          estabelecimentoUf: estabelecimentoUf,
          idSistemaOrigem: idSistemaOrigem,
          pacienteIdade: pacienteIdade,
          vacinaFabricanteReferencia: vacinaFabricanteReferencia,
          vacinaCodigo: vacinaCodigo,
          pacienteRacaCorCodigo: pacienteRacaCorCodigo,
          redshift: redshift,
        );

  factory VaccinationModel.fromJson(Map<String, dynamic> json) =>
      _$VaccinationModelFromJson(json);
}
