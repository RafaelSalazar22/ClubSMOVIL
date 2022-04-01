import 'dart:convert';
import 'dart:io';
import 'package:club/Models/Response.dart';
import 'package:club/Models/Torneo.dart';
import 'package:club/Providers/Providers.dart';
import 'package:club/screens/Torneo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import '../Models/Club.dart';
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
      request = decodelist(json.decode(response));
    } finally {
      client.close();
    }
  }
  Future<Response> post(Torneo torneo) async {
    const String endPoint = 'api/Torneo';
    final url = Uri.http(_host, endPoint);
    final client = RetryClient(http.Client());

    try {
      final response = await client.post(url,
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
          body: torneoToJson(torneo));
      print(response.body);
      return decode(json.decode(response.body));
    } finally {
      client.close();
    }
  }
   decodelist(Map<String, dynamic> json) => ListResponse(
          exito: json["exito"],
          mensaje: json["mensaje"],
          data: List<Torneo>.from(json["data"].map((x) => Torneo.fromJson(x))),
        );
    decode(Map<String, dynamic> json) => Response(
          exito: json["exito"],
          mensaje: json["mensaje"],
          data:json["data"]
        );
}