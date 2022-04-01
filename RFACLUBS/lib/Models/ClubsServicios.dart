import 'dart:convert';

ClubsServicios clubsServiciosFromJson(String str) =>
    ClubsServicios.fromJson(json.decode(str));

String clubsServiciosToJson(ClubsServicios data) => json.encode(data.toJson());

class ClubsServicios {
  ClubsServicios({
    this.idServicio,
    this.diciplina,
    this.horario,
    required this.cantidadPersonas,
    this.equipoespecial,
    this.personasLimitadas,
  });

  int? idServicio;
  String? diciplina;
  String? horario;
  int cantidadPersonas;
  bool? equipoespecial;
  bool? personasLimitadas;

  factory ClubsServicios.fromJson(Map<String, dynamic> json) => ClubsServicios(
        idServicio: json["idServicio"],
        diciplina: json["diciplina"],
        horario: json["horario"],
        cantidadPersonas: json["cantidadPersonas"],
        equipoespecial: json["equipoespecial"],
        personasLimitadas: json["personasLimitadas"],
      );

  Map<String, dynamic> toJson() => {
        "idServicio": idServicio,
        "diciplina": diciplina,
        "horario": horario,
        "cantidadPersonas": cantidadPersonas,
        "equipoespecial": equipoespecial,
        "personasLimitadas": personasLimitadas,
      };
}
