class Cliente {
  Cliente(this.id, this.cedclie, this.tipdoc, this.firstName, this.lastName,
      this.codstat, this.email, this.phone, this.createAs, this.updateAs);

  final int? id;
  final int cedclie;
  final String tipdoc;
  final String firstName;
  final String lastName;
  final String codstat;
  final String email;
  final String phone;
  final String createAs;
  final String updateAs;

  Map toMapper() {
    final Map data = {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'cedclie': cedclie,
      'id': id,
      'create_as': createAs,
      'update_as': updateAs,
      'tipdoc': tipdoc,
      'codstat': codstat
    };
    return data;
  }
}
