class User {
  User({
    this.id,
    this.nombre,
    this.apellidos,
    this.email,
    this.password,
    this.idClubs,
  });

  int? id;
  String? nombre;
  String? apellidos;
  String? email;
  String? password;
  int? idClubs;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        nombre: json["Nombre"],
        apellidos: json["Apellidos"],
        email: json["email"],
        password: json["Password"],
        idClubs: json["id_Clubs"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Nombre": nombre,
        "Apellidos": apellidos,
        "email": email,
        "Password": password,
        "id_Clubs": idClubs,
      };
}
