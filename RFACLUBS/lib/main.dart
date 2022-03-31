import 'dart:io';

import 'package:club/Providers/ClubsServiciosProviders.dart';
import 'package:club/Providers/TorneoProviders.dart';
import 'package:club/screens/blog.dart';
import 'package:club/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:club/screens/login.dart';
import 'package:provider/provider.dart';

import 'Providers/ClubProviders.dart';
import 'Providers/UserProviders.dart';



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Real Football Academy',
      
     home: const loginScreen(),
     theme: AppTheme.DarkTheme
    );
  }
}
void main() => runApp(const AppState());

class MyHttpOverrides extends HttpOverrides {
  @override
  // ignore: override_on_non_overriding_member
  HttpClient createHttpclient(SecurityContext? context) =>
      super.createHttpClient(context)
        ..badCertificateCallback = (cert, host, port) => true;
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

//Consumos
  @override
  Widget build(BuildContext context) {
    HttpOverrides.global = MyHttpOverrides();
    return MultiProvider( 
    providers: [
      
      ChangeNotifierProvider(
        create: (context) => UserProviders(), 
        lazy: false,),
         
      ChangeNotifierProvider(
        create: (context) => ClubsProvider(), 
        lazy: false,),
        ChangeNotifierProvider(
        create: (context) => ClubsServiciosProviders(), 
        lazy: false,),
        ChangeNotifierProvider(
        create: (context) => TorneoProviders(), 
        lazy: false,),

    ], child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Real Football Academy',
      theme:AppTheme.DarkTheme,  
     home: const loginScreen(),
    ));
  }
}