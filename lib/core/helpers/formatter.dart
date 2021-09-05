abstract class Formatters {
  static String valueToEmptyStringOrNull(dynamic value) {
    return value == null ? '' : value.toString();
  }
}
