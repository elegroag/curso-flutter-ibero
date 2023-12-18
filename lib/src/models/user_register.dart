class UserRegister {
  UserRegister(
      {this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.identification,
      required this.password,
      required this.confirmPassword});

  final int? id;
  final String firstName;
  final String lastName;
  final String email;
  final int identification;
  final String password;
  final String confirmPassword;

  Map toMapper() {
    final Map data = {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'identification': identification,
      'password': password,
      'confirm_password': confirmPassword,
      'create_as': DateTime.now().toString(),
      'update_as': DateTime.now().toString(),
      'is_available': true,
      'imagen': 'avatar01.jpg',
      'phone': '0'
    };
    return data;
  }
}
