class Clubs_Servicios {
  Clubs_Servicios({
    this.idServicio,
    this.diciplina,
    this.horario,
    this.equipoEspecial,
    this.personasEspeciales,
    this.idClubs,
  });

  int? idServicio;
  String? diciplina;
  String? horario;
  bool? equipoEspecial;
  bool? personasEspeciales;
  int? idClubs;

  factory Clubs_Servicios.fromJson(Map<String, dynamic> json) =>
      Clubs_Servicios(
        idServicio: json["id_Servicio"],
        diciplina: json["Diciplina"],
        horario: json["Horario"],
        equipoEspecial: json["Equipo_Especial"],
        personasEspeciales: json["Personas_Especiales"],
        idClubs: json["idClubs"],
      );

  Map<String, dynamic> toJson() => {
        "id_Servicio": idServicio,
        "Diciplina": diciplina,
        "Horario": horario,
        "Equipo_Especial": equipoEspecial,
        "Personas_Especiales": personasEspeciales,
        "idClubs": idClubs,
      };
}
