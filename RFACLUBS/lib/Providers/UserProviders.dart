import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import '../Models/ListResponse.dart';
import '../Models/Response.dart';
import '../Models/User.dart';



class UserProviders extends ChangeNotifier {
  final String _host = 'apiclubsapi.somee.com';

  ListResponse request = new ListResponse();
   

  UserProviders() {
    getStudents();
  }

  getStudents() async {
    const String endPoint = 'api/Usuario';

    final url = Uri.http(_host, endPoint);

    final client = RetryClient(http.Client());

    try {
      final response = await client.read(url);

      notifyListeners();

      print(response);
      request = decodelist(json.decode(response));
    } finally {
      client.close();
    }
  }

  Future<Response> post(Usuario usuario) async {
    const String endPoint = 'api/Usuario';
    final url = Uri.http(_host, endPoint);
    final client = RetryClient(http.Client());

    try {
      final response = await client.post(url,
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
          body: usuarioToJson(usuario));
      print(response.body);
      return decode(json.decode(response.body));
    } finally {
      client.close();
    }
  }
   decodelist(Map<String, dynamic> json) => ListResponse(
          exito: json["exito"],
          mensaje: json["mensaje"],
          data: List<Usuario>.from(json["data"].map((x) => Usuario.fromJson(x))),
        );
    decode(Map<String, dynamic> json) => Response(
          exito: json["exito"],
          mensaje: json["mensaje"],
          data:json["data"]
        );

    Map<String, dynamic> encode(ListResponse object) => {
          "exito": object.exito,
          "mensaje": object.mensaje,
          "data": object.data?.map((x) => x.toJson())
        };
}
