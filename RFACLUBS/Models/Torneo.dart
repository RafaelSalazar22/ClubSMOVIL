// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);


class Torneo {
    Torneo({
        this.idTorneo,
        this.nombreTorneo,
        this.cantidadEquipos,
        this.cantidadRondas,
        this.diciplina,
        this.horario,
        this.direccion,
        this.personasEspeciales,
    });

    int? idTorneo;
    String? nombreTorneo;
    String? cantidadEquipos;
    int? cantidadRondas;
    String? diciplina;
    String? horario;
    String? direccion;
    bool? personasEspeciales;

    factory Torneo.fromJson(Map<String, dynamic> json) => Torneo(
        idTorneo: json["id_Torneo"],
        nombreTorneo: json["NombreTorneo"],
        cantidadEquipos: json["cantidad_Equipos"],
        cantidadRondas: json["Cantidad_Rondas"],
        diciplina: json["Diciplina"],
        horario: json["Horario"],
        direccion: json["Direccion"],
        personasEspeciales: json["Personas_Especiales"],
    );

    Map<String, dynamic> toJson() => {
        "id_Torneo": idTorneo,
        "NombreTorneo": nombreTorneo,
        "cantidad_Equipos": cantidadEquipos,
        "Cantidad_Rondas": cantidadRondas,
        "Diciplina": diciplina,
        "Horario": horario,
        "Direccion": direccion,
        "Personas_Especiales": personasEspeciales,
    };
}

