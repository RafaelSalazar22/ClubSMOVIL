// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);


import 'dart:convert';

Torneo torneoFromJson(String str) => Torneo.fromJson(json.decode(str));

String torneoToJson(Torneo data) => json.encode(data.toJson());

class Torneo {
    Torneo({
        this.idTorneo,
        this.nombreTorneo,
       required  this.cantidadEquipos,
        required  this.cantidadRondas,
        this.diciplina,
        this.direccion,
        this.personasMovilidad,
    });

    int?idTorneo;
    String? nombreTorneo;
    int cantidadEquipos;
    int cantidadRondas;
    String? diciplina;
    String? direccion;
    bool? personasMovilidad;

    factory Torneo.fromJson(Map<String, dynamic> json) => Torneo(
        idTorneo: json["idTorneo"],
        nombreTorneo: json["nombreTorneo"],
        cantidadEquipos: json["cantidadEquipos"],
        cantidadRondas: json["cantidadRondas"],
        diciplina: json["diciplina"],
        direccion: json["direccion"],
        personasMovilidad: json["personasMovilidad"],
    );

    Map<String, dynamic> toJson() => {
        "idTorneo": idTorneo,
        "nombreTorneo": nombreTorneo,
        "cantidadEquipos": cantidadEquipos,
        "cantidadRondas": cantidadRondas,
        "diciplina": diciplina,
        "direccion": direccion,
        "personasMovilidad": personasMovilidad,
    };
}
