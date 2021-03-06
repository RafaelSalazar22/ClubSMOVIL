// ignore: file_names
// ignore_for_file: camel_case_types
import 'dart:ffi';

import 'package:club/Models/ClubsServicios.dart';
import 'package:club/Providers/ClubsServiciosProviders.dart';
import 'package:club/screens/blog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';

// ignore: camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/ListResponse.dart';
import 'blog.dart';

class servicios_clubs extends StatefulWidget {
  const servicios_clubs({Key? key}) : super(key: key);

  @override
  _Servicios_clubsState createState() => _Servicios_clubsState();
}

class _Servicios_clubsState extends State<servicios_clubs> {
  final _formKey = GlobalKey<FormState>();
  final ClubsServicios servicio1 = ClubsServicios(
    idServicio: 0,
    cantidadPersonas: 0,
  );
  bool _equipoespecial = false;
  bool _persespecial = false;

  List<String> items = [
    'Futbol',
    'Beisbol',
    'Basquetball',
    'Natacion',
    'Tenis',
  ];
  String? dropdownvalue = 'Futbol';
  @override
  Widget build(BuildContext context) {
    final clubsServiciosProviders =
        Provider.of<ClubsServiciosProviders>(context);
    final ListResponse servicio = clubsServiciosProviders.request;
    servicio1.equipoespecial = _equipoespecial;
    servicio1.personasLimitadas = _persespecial;
    servicio1.diciplina = dropdownvalue;
    final enviar = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Colors.redAccent,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
             clubsServiciosProviders.post(servicio1);
                         Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => blog(),
                    ));
              
            }
          },
          // ignore: prefer_const_constructors
          child: Text(
            "Registrar servicio",
            textAlign: TextAlign.center,
            // ignore: prefer_const_constructors
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Registro de servicio",
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
            child: SingleChildScrollView(
                child: Container(
                    color: Colors.white,
                    child: Padding(
                        padding: const EdgeInsets.all(36.0),
                        child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                    height: 180,
                                    child: Image.asset(
                                      "assets/Downloads/CLUB.png",
                                      fit: BoxFit.contain,
                                    )),
                                _crearDropDown(), // TextField con m??ltiples opciones de decoraci??n
                                const SizedBox(height: 20),
                                _horarioservicio(),
                                const SizedBox(height: 20),
                                _cantidadpersonas(),
                                const SizedBox(height: 20),
                                _crearSwitch(),
                                const SizedBox(height: 20),
                                _discapa(),
                                const SizedBox(height: 20),
                                enviar
                              ],
                            )))))));
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        activeColor: const Color.fromARGB(255, 218, 181, 15),
        title: const Text(
          '??Requiere Equipo Especial?',
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        secondary: const Icon(Icons.accessibility),
        value: _equipoespecial,
        onChanged: (valor) {
          setState(() {
            _equipoespecial = valor;
          });
        });
  }

  Widget _discapa() {
    return SwitchListTile(
        title: const Text(
          '??Aceptan con movilidad limitada?',
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        activeColor: const Color.fromARGB(255, 218, 181, 15),
        secondary: const Icon(Icons.accessibility),
        value: _persespecial,
        onChanged: (valor) {
          setState(() {
            _persespecial = valor;
          });
        });
    // ignore: dead_code
  }

  Widget _horarioservicio() {
    return TextFormField(
        autofocus: false,
        keyboardType: TextInputType.name,
        style: const TextStyle(color: Colors.black),
        initialValue: servicio1.horario,
        onChanged: (value) => servicio1.horario = value,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Este campo es obligatorio");
          }
          if (value.length > 8) {
            return ("No  puede escribir mas de  8 caracteres.");
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.date_range,
            color: Colors.grey,
          ),
          hintText: "Horario Ejemplo: 12:00pm",
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }

  Widget _crearDropDown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 1, color: Colors.black))),
      value: dropdownvalue,
      focusColor: Colors.white,
      iconDisabledColor: Colors.black,
      iconEnabledColor: Colors.black,
      dropdownColor: Colors.white,
      // Down Arrow Icon
      icon: const Icon(Icons.keyboard_arrow_down),
      items: items
          .map((items) => DropdownMenuItem<String>(
                value: items,
                child: Text(items,
                    style: const TextStyle(fontSize: 15, color: Colors.black)),
              ))
          .toList(),
      onChanged: (items) => setState(() => dropdownvalue = items),
    );
  }

  Widget _cantidadpersonas() {
    return TextFormField(
        autofocus: false,
        keyboardType: TextInputType.number,
        style: const TextStyle(color: Colors.black),
         initialValue: servicio1.cantidadPersonas.toString(),
        onChanged: (value) => servicio1.cantidadPersonas = int.parse(value),
        validator: (value) {
          if (value!.isEmpty) {
            return ("Este campo es obligatorio");
          }
          if (value.length > 2) {
            return ("No  escribir mas de dos cifras.");
          }
          final n = num.tryParse(value);
          if (n  == 5 || n == null) {
            return 'El numero de personas debe de ser mayor a 5';
          }
          if(n < 5 )
          {
              return 'El numero de personas debe de ser mayor a 5';
          }
          // reg expression for email validation
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.people,
            color: Colors.grey,
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Cantidad de personas que aceptan en el servicio del club",
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}
