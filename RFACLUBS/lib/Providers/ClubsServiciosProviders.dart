import 'dart:convert';
import 'package:club/Models/Clubs_Servicios.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class ClubsServiciosProviders extends ChangeNotifier {
  List<Clubs_Servicios> clubs_servicios = [];
  final String _host = 'my.api.mockaroo.com';
  final Map<String, dynamic> _parameters = {'key': 'c023f810'};
  ClubsServiciosProviders() {
    fetchReportes();
  }
//https://my.api.mockaroo.com/reporte.json?key=960d9f80
  fetchReportes() async {
    const String endPoint = 'clubs_servicio.json';
    final url = Uri.https(_host, endPoint, _parameters);
    final client = RetryClient(http.Client());

    try {
      final response = await client.read(url);
      notifyListeners();
      clubs_servicios = List<Clubs_Servicios>.from(
          json.decode(response).map((x) => Clubs_Servicios.fromJson(x)));
    } finally {
      client.close();
    }
  }
}
