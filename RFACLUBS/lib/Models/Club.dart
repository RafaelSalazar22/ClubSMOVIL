// ignore: file_names
import 'dart:convert';

Club clubFromJson(String str) => Club.fromJson(json.decode(str));

String clubToJson(Club data) => json.encode(data.toJson());

class Club {
    Club({
        this.idClub,
        this.nombreClub,
        this.direccion,
        this.telefono,
        this.hoarioClub,
    });

    int?idClub;
    String? nombreClub;
    String? direccion;
    String? telefono;
    String? hoarioClub;

    factory Club.fromJson(Map<String, dynamic> json) => Club(
        idClub: json["idClub"],
        nombreClub: json["nombreClub"],
        direccion: json["direccion"],
        telefono: json["telefono"],
        hoarioClub: json["hoarioClub"],
    );

    Map<String, dynamic> toJson() => {
        "idClub": idClub,
        "nombreClub": nombreClub,
        "direccion": direccion,
        "telefono": telefono,
        "hoarioClub": hoarioClub,
    };
}
