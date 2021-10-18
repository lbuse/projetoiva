// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VaccinationEnvelope _$VaccinationEnvelopeFromJson(Map<String, dynamic> json) =>
    VaccinationEnvelope(
      json['_scroll_id'] as String?,
      json['hits'] == null
          ? null
          : SystemRecords.fromJson(json['hits'] as Map<String, dynamic>),
    );

SystemRecords _$SystemRecordsFromJson(Map<String, dynamic> json) =>
    SystemRecords(
      (json['hits'] as List<dynamic>?)
          ?.map((e) => DataSource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

DataSource _$DataSourceFromJson(Map<String, dynamic> json) => DataSource(
      json['_source'] == null
          ? null
          : VaccinationModel.fromJson(json['_source'] as Map<String, dynamic>),
    );

VaccinationModel _$VaccinationModelFromJson(Map<String, dynamic> json) =>
    VaccinationModel(
      pacienteEnderecoCoIbgeMunicipio:
          json['paciente_endereco_coIbgeMunicipio'] as String?,
      documentId: json['document_id'] as String?,
      dataImportacaoRnds: json['data_importacao_rnds'] as String?,
      sistemaOrigem: json['sistema_origem'] as String?,
      version: json['@version'] as String?,
      estabelecimentoRazaoSocial:
          json['estabelecimento_razaoSocial'] as String?,
      pacienteNacionalidadeEnumNacionalidade:
          json['paciente_nacionalidade_enumNacionalidade'] as String?,
      timestamp: json['@timestamp'] as String?,
      pacienteEnderecoCoPais: json['paciente_endereco_coPais'] as String?,
      vacinaGrupoAtendimentoNome:
          json['vacina_grupoAtendimento_nome'] as String?,
      vacinaGrupoAtendimentoCodigo:
          json['vacina_grupoAtendimento_codigo'] as String?,
      vacinaCategoriaCodigo: json['vacina_categoria_codigo'] as String?,
      vacinaDescricaoDose: json['vacina_descricao_dose'] as String?,
      vacinaCategoriaNome: json['vacina_categoria_nome'] as String?,
      vacinaLote: json['vacina_lote'] as String?,
      pacienteEnumSexoBiologico: json['paciente_enumSexoBiologico'] as String?,
      pacienteEnderecoNmMunicipio:
          json['paciente_endereco_nmMunicipio'] as String?,
      pacienteEnderecoUf: json['paciente_endereco_uf'] as String?,
      pacienteEnderecoNmPais: json['paciente_endereco_nmPais'] as String?,
      vacinaNome: json['vacina_nome'] as String?,
      dtDeleted: json['dt_deleted'] == null
          ? null
          : DateTime.parse(json['dt_deleted'] as String),
      pacienteRacaCorValor: json['paciente_racaCor_valor'] as String?,
      pacienteId: json['paciente_id'] as String?,
      estabelecimentoValor: json['estabelecimento_valor'] as String?,
      pacienteDataNascimento: json['paciente_dataNascimento'] as String?,
      vacinaFabricanteNome: json['vacina_fabricante_nome'] as String?,
      vacinaDataAplicacao: json['vacina_dataAplicacao'] as String?,
      pacienteEnderecoCep: json['paciente_endereco_cep'] as String?,
      estabelecimentoMunicipioNome:
          json['estabelecimento_municipio_nome'] as String?,
      estabelecimentoMunicipioCodigo:
          json['estabelecimento_municipio_codigo'] as String?,
      status: json['status'] as String?,
      estabelecimentoUf: json['estabelecimento_uf'] as String?,
      idSistemaOrigem: json['id_sistema_origem'] as String?,
      pacienteIdade: json['paciente_idade'] as int?,
      vacinaFabricanteReferencia:
          json['vacina_fabricante_referencia'] as String?,
      vacinaCodigo: json['vacina_codigo'] as String?,
      pacienteRacaCorCodigo: json['paciente_racaCor_codigo'] as String?,
      redshift: json['redshift'] as String?,
      estalecimentoNoFantasia: json['estalecimento_noFantasia'] as String?,
    );
