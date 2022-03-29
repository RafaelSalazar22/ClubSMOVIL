import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import '../Models/Club.dart';
import '../Models/User.dart';

class ClubProviders extends ChangeNotifier{
  List<Club> club = [];
  final String _host ='my.api.mockaroo.com';
  final Map<String, dynamic> _parameters = {'key':'dfad0a00'};
  ClubProviders(){
    fetchReportes();
  }
//https://my.api.mockaroo.com/reporte.json?key=960d9f80
  fetchReportes() async {
    const String endPoint ='club.json';
    final url = Uri.https(_host, endPoint, _parameters);
    final client = RetryClient(http.Client());

    try {
      final response = await client.read(url);
      notifyListeners();
      print(response);
      club =
         List<Club>.from(json.decode(response).map((x) => Club.fromJson(x)));
    } finally {
      client.close();
     }
  } 
}