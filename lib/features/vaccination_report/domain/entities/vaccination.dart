import 'package:json_annotation/json_annotation.dart';

class Vaccination {
  @JsonKey(name: 'paciente_endereco_coIbgeMunicipio')
  final String pacienteEnderecoCoIbgeMunicipio;
  @JsonKey(name: 'document_id')
  final String documentId;
  @JsonKey(name: 'data_importacao_rnds')
  final String dataImportacaoRnds;
  @JsonKey(name: 'sistema_origem')
  final String sistemaOrigem;
  @JsonKey(name: '@version')
  final String version;
  @JsonKey(name: 'estabelecimento_razaoSocial')
  final String estabelecimentoRazaoSocial;
  @JsonKey(name: 'paciente_nacionalidade_enumNacionalidade')
  final String pacienteNacionalidadeEnumNacionalidade;
  @JsonKey(name: '@timestamp')
  final String timestamp;
  @JsonKey(name: 'paciente_endereco_coPais')
  final String pacienteEnderecoCoPais;
  @JsonKey(name: 'vacina_grupoAtendimento_nome')
  final String vacinaGrupoAtendimentoNome;
  @JsonKey(name: 'vacina_grupoAtendimento_codigo')
  final String vacinaGrupoAtendimentoCodigo;
  @JsonKey(name: 'vacina_categoria_codigo')
  final String vacinaCategoriaCodigo;
  @JsonKey(name: 'vacina_descricao_dose')
  final String vacinaDescricaoDose;
  @JsonKey(name: 'vacina_categoria_nome')
  final String vacinaCategoriaNome;
  @JsonKey(name: 'vacina_lote')
  final String vacinaLote;
  @JsonKey(name: 'paciente_enumSexoBiologico')
  final String pacienteEnumSexoBiologico;
  @JsonKey(name: 'paciente_endereco_nmMunicipio')
  final String pacienteEnderecoNmMunicipio;
  @JsonKey(name: 'paciente_endereco_uf')
  final String pacienteEnderecoUf;
  @JsonKey(name: 'paciente_endereco_nmPais')
  final String pacienteEnderecoNmPais;
  @JsonKey(name: 'vacina_nome')
  final String vacinaNome;
  @JsonKey(name: 'dt_deleted')
  final DateTime dtDeleted;
  @JsonKey(name: 'paciente_racaCor_valor')
  final String pacienteRacaCorValor;
  @JsonKey(name: 'paciente_id')
  final String pacienteId;
  @JsonKey(name: 'estabelecimento_valor')
  final String estabelecimentoValor;
  @JsonKey(name: 'paciente_dataNascimento')
  final String pacienteDataNascimento;
  @JsonKey(name: 'vacina_fabricante_nome')
  final String vacinaFabricanteNome;
  @JsonKey(name: 'vacina_dataAplicacao')
  final String vacinaDataAplicacao;
  @JsonKey(name: 'paciente_endereco_cep')
  final String pacienteEnderecoCep;
  @JsonKey(name: 'estabelecimento_municipio_nome')
  final String estabelecimentoMunicipioNome;
  @JsonKey(name: 'estabelecimento_municipio_codigo')
  final String estabelecimentoMunicipioCodigo;
  @JsonKey(name: 'status')
  final String status;
  @JsonKey(name: 'estabelecimento_uf')
  final String estabelecimentoUf;
  @JsonKey(name: 'id_sistema_origem')
  final String idSistemaOrigem;
  @JsonKey(name: 'paciente_idade')
  final int pacienteIdade;
  @JsonKey(name: 'vacina_fabricante_referencia')
  final String vacinaFabricanteReferencia;
  @JsonKey(name: 'vacina_codigo')
  final String vacinaCodigo;
  @JsonKey(name: 'paciente_racaCor_codigo')
  final String pacienteRacaCorCodigo;
  @JsonKey(name: 'redshift')
  final String redshift;
  @JsonKey(name: 'estalecimento_noFantasia')
  final String estalecimentoNoFantasia;

  const Vaccination({
    this.pacienteEnderecoCoIbgeMunicipio,
    this.documentId,
    this.dataImportacaoRnds,
    this.sistemaOrigem,
    this.version,
    this.estabelecimentoRazaoSocial,
    this.pacienteNacionalidadeEnumNacionalidade,
    this.timestamp,
    this.pacienteEnderecoCoPais,
    this.vacinaGrupoAtendimentoNome,
    this.vacinaGrupoAtendimentoCodigo,
    this.vacinaCategoriaCodigo,
    this.vacinaDescricaoDose,
    this.vacinaCategoriaNome,
    this.vacinaLote,
    this.pacienteEnumSexoBiologico,
    this.pacienteEnderecoNmMunicipio,
    this.pacienteEnderecoUf,
    this.pacienteEnderecoNmPais,
    this.vacinaNome,
    this.dtDeleted,
    this.pacienteRacaCorValor,
    this.pacienteId,
    this.estabelecimentoValor,
    this.pacienteDataNascimento,
    this.vacinaFabricanteNome,
    this.vacinaDataAplicacao,
    this.pacienteEnderecoCep,
    this.estabelecimentoMunicipioNome,
    this.estabelecimentoMunicipioCodigo,
    this.status,
    this.estabelecimentoUf,
    this.idSistemaOrigem,
    this.pacienteIdade,
    this.vacinaFabricanteReferencia,
    this.vacinaCodigo,
    this.pacienteRacaCorCodigo,
    this.redshift,
    this.estalecimentoNoFantasia,
  });
}
