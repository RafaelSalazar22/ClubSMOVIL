import 'package:club/screens/blog.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types

class torneo extends StatefulWidget {
  const torneo({Key? key}) : super(key: key);

  @override
  _TorneosState createState() => _TorneosState();
}

class _TorneosState extends State<torneo> {
  bool _switchHospitalizado = false;
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
    final enviar = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Colors.redAccent,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => blog(),
                ));
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
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
          children: [
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
            _horariotorneo(),
            const SizedBox(height: 20),
            _direccionTorneo(),
            const SizedBox(height: 20),
            _personasdife(),
            const SizedBox(height: 20),
            enviar
          ],
        ));
  }

  Widget _personasdife() {
    return SwitchListTile(
        title: const Text(
          '¿Aceptan personas con movilidad limitada?',
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        secondary: const Icon(Icons.accessibility),
        value: _switchHospitalizado,
        onChanged: (valor) {
          setState(() {
            _switchHospitalizado = valor;
          });
        });
  }

  Widget _horariotorneo() {
    return TextFormField(
        autofocus: false,
        keyboardType: TextInputType.datetime,
        style: const TextStyle(color: Colors.black),
        validator: (value) {
          if (value!.isEmpty) {
            return ("Este campo es obligatorio");
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.date_range,
            color: Colors.grey,
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Horario Ejemplo: 12:00pm",
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }

  Widget _diciplina() {
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

  Widget _cantidadequipo() {
    return TextFormField(
        autofocus: false,
        keyboardType: TextInputType.number,
        style: const TextStyle(color: Colors.black),
        validator: (value) {
          if (value!.isEmpty) {
            return ("Este campo es obligatorio");
          }
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
}

Widget _numrondas() {
  return TextFormField(
      autofocus: false,
      keyboardType: TextInputType.number,
      style: const TextStyle(color: Colors.black),
      validator: (value) {
        if (value!.isEmpty) {
          return ("Este campo es obligatorio");
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
      autofocus: false,
      keyboardType: TextInputType.streetAddress,
      style: const TextStyle(color: Colors.black),
      validator: (value) {
        if (value!.isEmpty) {
          return ("Este campo es obligatorio");
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
