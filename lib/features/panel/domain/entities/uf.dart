class Uf {
  final int? id;
  final String? nome;
  final String? sigla;

  Uf({
    this.id,
    this.nome,
    this.sigla,
  });

  bool get isIdValid => id != null && id! > 0;
  bool get isNomeValid => nome != null && nome!.isNotEmpty;
  bool get isSiglaValid => sigla != null && sigla!.isNotEmpty;
  bool get isValid => isIdValid && isNomeValid && isSiglaValid;
}
