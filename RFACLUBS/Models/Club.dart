
class Club {
    Club({
        this.idClubs,
        this.nombreClubs,
        this.direccion,
        this.telefono,
        this.hoarioClub,
        this.geoubicacion,
    });

    int ?idClubs;
    String? nombreClubs;
    String? direccion;
    String? telefono;
    String? hoarioClub;
    String? geoubicacion;

    factory Club.fromJson(Map<String, dynamic> json) => Club(
        idClubs: json["id_Clubs"],
        nombreClubs: json["Nombre_Clubs"],
        direccion: json["Direccion"],
        telefono: json["Telefono"],
        hoarioClub: json["Hoario Club"],
        geoubicacion: json["Geoubicacion"],
    );

    Map<String, dynamic> toJson() => {
        "id_Clubs": idClubs,
        "Nombre_Clubs": nombreClubs,
        "Direccion": direccion,
        "Telefono": telefono,
        "Hoario Club": hoarioClub,
        "Geoubicacion": geoubicacion,
    };
}
