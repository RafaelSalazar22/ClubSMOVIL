import 'package:club/Models/Torneo.dart';
import 'package:club/Providers/TorneoProviders.dart';
import 'package:club/screens/blog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/ListResponse.dart';

// ignore: camel_case_types

class torneo extends StatefulWidget {
  const torneo({Key? key}) : super(key: key);

  @override
  _TorneosState createState() => _TorneosState();
}

class _TorneosState extends State<torneo> {
  bool _switchHospitalizado = false;
  final Torneo torneo1 =
      Torneo(idTorneo: 0, cantidadEquipos: 0, cantidadRondas: 0);
  final _formKey = GlobalKey<FormState>();
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
    final torneoProviders = Provider.of<TorneoProviders>(context);
    final ListResponse torneo = torneoProviders.request;
    torneo1.personasMovilidad = _switchHospitalizado;
    torneo1.diciplina = dropdownvalue;
    final enviar = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Colors.redAccent,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              torneoProviders.post(torneo1);
              if (torneoProviders.request.exito == 1) {
                Scaffold.of(context)
                    // ignore: deprecated_member_use, unnecessary_const
                    .showSnackBar(const SnackBar(
                        content: Text('El torneo se  agrego exitosamente')));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => blog(),
                    ));
              } else {
                Scaffold.of(context)
                    // ignore: deprecated_member_use, unnecessary_const
                    .showSnackBar(const SnackBar(
                        content: Text('El torneo no se  agrego exitosamente')));
              }
            }
          },
          child: const Text(
            "Registrar Torneo",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Registro de Torneo",
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
                                _nombretorneo(), // TextField con múltiples opciones de decoración
                                const SizedBox(height: 20),
                                _cantidadequipo(),
                                const SizedBox(height: 20),
                                _numrondas(),
                                const SizedBox(height: 20),
                                _diciplina(),
                                const SizedBox(height: 20),
                                _direccionTorneo(),
                                const SizedBox(height: 20),
                                _personasdife(),
                                const SizedBox(height: 20),
                                enviar
                              ],
                            )))))));
  }

  Widget _personasdife() {
    return SwitchListTile(
        value: _switchHospitalizado,
        activeColor: const Color.fromARGB(255, 218, 181, 15),
        title: const Text(
          '¿Aceptan personas con movilidad limitada?',
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        secondary: const Icon(Icons.accessibility),
        onChanged: (valor) {
          setState(() {
            _switchHospitalizado = valor;
          });
        });
  }

  // Widget _horariotorneo() {
  //   return TextFormField(
  //       initialValue: torneo1.diciplina,
  //       onChanged: (value) => torneo1.direccion = value,
  //       autofocus: false,
  //       keyboardType: TextInputType.datetime,
  //       style: const TextStyle(color: Colors.black),
  //       validator: (value) {
  //         if (value!.isEmpty) {
  //           return ("Este campo es obligatorio");
  //         }
  //         if (value.length > 6) {
  //           return ("No  puede escribir mas de  6 caracteres.");
  //         }
  //         return null;
  //       },
  //       textInputAction: TextInputAction.next,
  //       decoration: InputDecoration(
  //         prefixIcon: const Icon(
  //           Icons.date_range,
  //           color: Colors.grey,
  //         ),
  //         contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
  //         hintText: "Horario Ejemplo: 12:00",
  //         hintStyle: const TextStyle(color: Colors.grey),
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(10),
  //         ),
  //       ));
  // }

  Widget _diciplina() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 1, color: Colors.black))),
      focusColor: Colors.white,
      iconDisabledColor: Colors.black,
      iconEnabledColor: Colors.black,
      dropdownColor: Colors.white,
      value: dropdownvalue,
      // Down Arrow Icon
      icon: const Icon(Icons.keyboard_arrow_down),
      items: items
          .map((items) => DropdownMenuItem<String>(
                value: items,
                child: Text(items,
                    style: const TextStyle(fontSize: 15, color: Colors.black)),
              ))
          .toList(),
      onChanged: (items) => setState(() => dropdownvalue = items!),
    );
  }

  Widget _cantidadequipo() {
    return TextFormField(
        initialValue: torneo1.cantidadEquipos.toString(),
        onChanged: (value) => torneo1.cantidadEquipos = int.parse(value),
        autofocus: false,
        keyboardType: TextInputType.number,
        style: const TextStyle(color: Colors.black),
        validator: (value) {
          if (value!.isEmpty) {
            return ("Este campo es obligatorio");
          }
          if (value.length > 3) {
            return ("No  puede escribir mas de  3 caracteres.");
          }
          final n = num.tryParse(value);
          if (n == 0 || n == null) {
            return 'El numero de equipos debe de ser mayor a 0';
          }
          if (n <= 1) {
            return 'El numero de equipos debe de ser mayor a 1 ';
          }
          // reg expression for email validation
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.people_alt,
            color: Colors.grey,
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Cantidad de equipos que pueden participar",
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }

  Widget _numrondas() {
    return TextFormField(
        autofocus: false,
        keyboardType: TextInputType.number,
        style: const TextStyle(color: Colors.black),
        initialValue: torneo1.cantidadRondas.toString(),
        onChanged: (value) => torneo1.cantidadRondas = int.parse(value),
        validator: (value) {
          if (value!.isEmpty) {
            return ("Este campo es obligatorio");
          }
          if (value.length > 3) {
            return ("No  puede escribir mas de  3 caracteres.");
          }
          final n = num.tryParse(value);
          if (n == 0 || n == null || n <= 5) {
            return 'El numero de rondas debe de ser mayor a 0';
          }

          // reg expression for email validation
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.sports_hockey_outlined,
            color: Colors.grey,
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Cantidad de rondas del torneo",
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }

  Widget _direccionTorneo() {
    return TextFormField(
        initialValue: torneo1.direccion,
        onChanged: (value) => torneo1.direccion = value,
        autofocus: false,
        keyboardType: TextInputType.streetAddress,
        style: const TextStyle(color: Colors.black),
        validator: (value) {
          if (value!.isEmpty) {
            return ("Este campo es obligatorio");
          }
          if (value.length > 40) {
            return ("No  puede escribir mas de  40 caracteres.");
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.add_business_rounded,
            color: Colors.grey,
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Dirección: Ejemplo: Calle 48 x 173 y 175",
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }

  Widget _nombretorneo() {
    return TextFormField(
        initialValue: torneo1.nombreTorneo,
        onChanged: (value) => torneo1.nombreTorneo = value,
        autofocus: true,
        keyboardType: TextInputType.name,
        style: const TextStyle(color: Colors.black),
        validator: (value) {
          RegExp regex = RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("Este campo es obligatorio");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          if (value.length > 20) {
            return ("No  puede escribir mas de  20 caracteres.");
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.tour_sharp,
            color: Colors.grey,
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Nombrel del Torneo",
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}
