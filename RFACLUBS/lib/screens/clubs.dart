import 'package:club/screens/Servicio_clubs.dart';
import 'package:club/screens/blog.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types

class clubs extends StatefulWidget {
  const clubs({Key? key}) : super(key: key);

  @override
  _ClubscreenState createState() => _ClubscreenState();
}

class _ClubscreenState extends State<clubs> {
  // our form key
  final _formKey = GlobalKey<FormState>();
  // editing Controller

  @override
  Widget build(BuildContext context) {
    //first name field
    final nombreclub = TextFormField(
        autofocus: true,
        autocorrect: true,
        maxLines: 1,
        keyboardType: TextInputType.name,
        style: const TextStyle(color: Colors.black),
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("Este campo es obligatorio");
          }
          if(value.length>20){
            return ("No  puede escribir mas de  20 caracteres.");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.support_sharp,
            color: Colors.grey,
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Nombre del club",
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //second name field
    final direccionclub = TextFormField(
        autofocus: false,
        autocorrect: true,
        maxLines: 1,
        keyboardType: TextInputType.streetAddress,
        style: const TextStyle(color: Colors.black),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Este campo es obligatorio';
          }
          if(value.length>40){
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

    //email field
    final telefonoclub = TextFormField(
        autofocus: false,
        autocorrect: true,
        maxLines: 1,
        keyboardType: TextInputType.phone,
        style: const TextStyle(color: Colors.black),
        validator: (value) {
          // ignore: unnecessary_new
          if (value == null || value.isEmpty) {
            return 'Este campo es requerido';
          }
          if(value.length>10){
            return ("No  puede escribir mas de  10 caracteres.");
          }
        
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.phone_sharp,
            color: Colors.grey,
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Numero Telefonico ",
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //password field
    final horarioclub = TextFormField(
        autofocus: false,
        autocorrect: true,
        maxLines: 1,
        keyboardType: TextInputType.datetime,
        style: const TextStyle(color: Colors.black),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Este campo es obligatorio';
          }
          if(value.length>6){
            return ("No  puede escribir mas de  6 caracteres.");
          }
          return null;
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.date_range,
            color: Colors.grey,
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Horario del club : Ejemplo: 12:00pm",
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
    //signup button
    final siguienteclub = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Colors.redAccent,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  blog(),
                  ));
            }
          },
          child: const Text(
            "Registrar Club",
            textAlign: TextAlign.center,
            // ignore: unnecessary_const
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Registro de club",
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
                    const SizedBox(height: 45),
                    nombreclub,
                    const SizedBox(height: 20),
                    direccionclub,
                    const SizedBox(height: 20),
                    telefonoclub,
                    const SizedBox(height: 20),
                    horarioclub,
                    const SizedBox(height: 20),
                    siguienteclub,
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}