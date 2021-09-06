extension StringExtensions on String? {
  bool get isNotNullAndNotEmpty => this != null && this!.isNotEmpty;
}
