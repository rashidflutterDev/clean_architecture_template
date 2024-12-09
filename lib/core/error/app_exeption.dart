class AppExeption implements Exception {
  final String message;
  const AppExeption(this.message);

  @override
  String toString() => 'AppExeption(message: $message)';
}
