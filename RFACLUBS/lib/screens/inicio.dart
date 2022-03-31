import 'package:flutter/material.dart';

import 'blog.dart';

class FormularioPage extends StatefulWidget {
  const FormularioPage({Key? key}) : super(key: key);

  @override
  _FormularioPageState createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {
 
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
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
          children: [
            SizedBox(
                height: 180,
                child: Image.asset(
                  "assets/Downloads/CLUB.png",
                  fit: BoxFit.contain,
                )),
            _crearDropDown(), // TextField con múltiples opciones de decoración
            const SizedBox(height: 20),
            _horarioservicio(),           
            const SizedBox(height: 20),
            _cantidadpersonas(),
            const SizedBox(height: 20),
            _horarioservicio(),
            const SizedBox(height: 20),
            _crearSwitch(),
              const SizedBox(height: 20),
            _discapa(),
            const SizedBox(height: 20),
            enviar
          ],
        ));
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        subtitle: const Text(
          '¿Requiere Equipo Especial?',
          style: TextStyle(color: Colors.black),
        ),
        secondary: const Icon(Icons.accessibility),
        value: _switchHospitalizado,
        onChanged: (valor) {
          setState(() {
            _switchHospitalizado = valor;
          });
        });
  }
  Widget _discapa() {
    return SwitchListTile(
        subtitle: const Text(
          '¿Aceptan personas con movilidad limitada?',
          style: TextStyle(color: Colors.black),
        ),
        secondary: const Icon(Icons.accessibility),
        value: _switchHospitalizado,
        onChanged: (valor) {
          setState(() {
            _switchHospitalizado = valor;
          });
        });
  }

  Widget _horarioservicio() {
    return TextFormField(
        autofocus: false,
        keyboardType: TextInputType.name,
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
                    style: TextStyle(fontSize: 15, color: Colors.black)),
              ))
          .toList(),
      onChanged: (items) => setState(() => dropdownvalue = items),
    );
  }


  Widget _cantidadpersonas () {
    return TextFormField(
        autofocus: false,
        keyboardType: TextInputType.emailAddress,
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
