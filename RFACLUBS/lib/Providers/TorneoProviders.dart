import 'dart:convert';
import 'package:club/Models/Torneo.dart';
import 'package:club/Providers/Providers.dart';
import 'package:club/screens/Torneo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import '../Models/ListResponse.dart';
import '../Models/User.dart';

class TorneoProviders extends ChangeNotifier {
  final String _host = 'apiclubsapi.somee.com';

  ListResponse request = new ListResponse();

  TorneoProviders() {
    getStudents();
  }

  getStudents() async {
    const String endPoint = 'api/Torneo';

    final url = Uri.http(_host, endPoint);

    final client = RetryClient(http.Client());

    try {
      final response = await client.read(url);

      notifyListeners();

      print(response);
      request = decode(json.decode(response));
    } finally {
      client.close();
    }
  }
  decode(Map<String, dynamic> json) => ListResponse(
          exito: json["exito"],
          mensaje: json["mensaje"],
          data: List<Torneo>.from(json["data"].map((x) => Torneo.fromJson(x))),
        );

    Map<String, dynamic> encode(ListResponse object) => {
          "exito": object.exito,
          "mensaje": object.mensaje,
          "data": object.data?.map((x) => x.toJson())
        };
}