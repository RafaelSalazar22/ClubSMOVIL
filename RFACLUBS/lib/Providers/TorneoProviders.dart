import 'dart:convert';
import 'package:club/Models/Torneo.dart';
import 'package:club/Providers/Providers.dart';
import 'package:club/screens/Torneo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import '../Models/User.dart';

class TorneoProviders extends ChangeNotifier {
  List<Torneo> torneo = [];
  final String _host = 'my.api.mockaroo.com';
  final Map<String, dynamic> _parameters = {'key': 'dfad0a00'};
  TorneoProviders() {
    fetchReportes();
  }
//https://my.api.mockaroo.com/reporte.json?key=960d9f80
  fetchReportes() async {
    const String endPoint = 'torneo.json';
    final url = Uri.https(_host, endPoint, _parameters);
    final client = RetryClient(http.Client());

    try {
      final response = await client.read(url);
      notifyListeners();
      torneo =
          List<Torneo>.from(json.decode(response).map((x) => Torneo.fromJson(x)));
    } finally {
      client.close();
    }
  }
}
