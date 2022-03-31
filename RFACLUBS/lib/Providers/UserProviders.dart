import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import '../Models/User.dart';

class UserProviders extends ChangeNotifier{
  List<User> user = [];
  final String _host ='my.api.mockaroo.com';
  final Map<String, dynamic> _parameters = {'key':'c023f810'};
  UserProviders(){
    fetchReportes();
  }
//https://my.api.mockaroo.com/reporte.json?key=960d9f80
  fetchReportes() async {
    const String endPoint ='user.json';
    final url = Uri.https(_host, endPoint, _parameters);
    final client = RetryClient(http.Client());

    try {
      final response = await client.read(url);
      notifyListeners();
      user =
         List<User>.from(json.decode(response).map((x) => User.fromJson(x)));
    } finally {
      client.close();
     }
  } 
}