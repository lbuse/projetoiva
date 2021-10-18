/// Formatadores genéricos para uso no projeto.
abstract class Formatters {
  /// Converte [value] para string e caso seja nulo, retorna uma
  /// `String` vazia.
  static String valueToStringOrEmpty(dynamic value) {
    return value == null ? '' : value.toString();
  }
}
