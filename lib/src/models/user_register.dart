class UserRegister {
  UserRegister(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.identification,
      required this.password,
      required this.confirmPassword});

  final String firstName;
  final String lastName;
  final String email;
  final int identification;
  final String password;
  final String confirmPassword;

  Map toMapper() {
    final Map data = {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'identification': identification,
      'password': password,
      'confirm_password': confirmPassword
    };
    return data;
  }
}
