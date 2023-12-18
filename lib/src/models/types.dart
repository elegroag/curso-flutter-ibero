class Credenciales {
  Credenciales({this.email = '', this.password = ''});

  String email;
  String password;
}

class ResponseToken {
  ResponseToken({required this.token, required this.success, this.error = ''});

  dynamic token;
  dynamic success;
  dynamic error;
}

class ScreenArguments {
  final String email;
  final String token;

  ScreenArguments(this.email, this.token);
}

class SecItem {
  SecItem(this.key, this.value);

  final String key;
  final String value;
}
