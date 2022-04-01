// ignore: file_names
import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
    Usuario({
        this.idUser,
        this.nombre,
        this.apellidos,
        this.correo,
        this.password,
    });

    int?idUser;
    String? nombre;
    String? apellidos;
    String? correo;
    String?password;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        idUser: json["idUser"],
        nombre: json["nombre"],
        apellidos: json["apellidos"],
        correo: json["correo"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "idUser": idUser,
        "nombre": nombre,
        "apellidos": apellidos,
        "correo": correo,
        "password": password,
    };
}
