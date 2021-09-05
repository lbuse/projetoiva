class City {
  final int id;
  final String nome;

  City({
    this.id,
    this.nome,
  });

  bool get isIdValid => id != null && id > 0;
  bool get isNomeValid => nome != null && nome.isNotEmpty;
  bool get isValid => isIdValid && isNomeValid;
}
