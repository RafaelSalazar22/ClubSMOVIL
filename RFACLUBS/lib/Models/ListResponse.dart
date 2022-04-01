// To parse this JSON data, do
//
//     final response = responseFromJson(jsonString);



//Response responseFromJson(String str) => Response.fromJson(json.decode(str));

//String responseToJson(Response data) => json.encode(data.toJson());

class ListResponse {
  ListResponse({
    this.exito,
    this.mensaje,
    this.data,
  });

  int? exito;
  String? mensaje;
  List<dynamic>? data;
}
