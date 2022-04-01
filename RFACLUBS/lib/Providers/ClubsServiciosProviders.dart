import 'dart:convert';
import 'dart:io';
import 'package:club/Models/ClubsServicios.dart';
import 'package:club/Models/Response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

import '../Models/ListResponse.dart';

class ClubsServiciosProviders extends ChangeNotifier {
   final String _host = 'apiclubsapi.somee.com';

  ListResponse request = new ListResponse();
   

  UserProviders() {
    getStudents();
  }

  getStudents() async {
    const String endPoint = 'api/Servicioclub';

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

  Future<Response> post(ClubsServicios usuario) async {
    const String endPoint = 'api/Servicioclub';
    final url = Uri.http(_host, endPoint);
    final client = RetryClient(http.Client());

    try {
      final response = await client.post(url,
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
          body: clubsServiciosToJson(usuario));
      print(response.body);
      return decode(json.decode(response.body));
    } finally {
      client.close();
    }
  }
   decodelist(Map<String, dynamic> json) => ListResponse(
          exito: json["exito"],
          mensaje: json["mensaje"],
          data: List<ClubsServicios>.from(json["data"].map((x) => ClubsServicios.fromJson(x))),
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

