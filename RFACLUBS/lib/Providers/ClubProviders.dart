import 'dart:convert';
import 'package:club/Models/Club.dart';
import 'package:club/Models/ListResponse.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class ClubsProvider extends ChangeNotifier {
  final String _host = 'apiclubsapi.somee.com';

  ListResponse request = new ListResponse();

  ClubsProvider() {
    getStudents();
  }

  getStudents() async {
    const String endPoint = 'api/Club';

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
          data: List<Club>.from(json["data"].map((x) => Club.fromJson(x))),
        );

    Map<String, dynamic> encode(ListResponse object) => {
          "exito": object.exito,
          "mensaje": object.mensaje,
          "data": object.data?.map((x) => x.toJson())
        };
}
