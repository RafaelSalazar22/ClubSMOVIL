import 'package:club/screens/Servicio_clubs.dart';
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
        keyboardType: TextInputType.name,
        style: TextStyle(color: Colors.black),
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
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
          prefixIcon: Icon(
            Icons.support_sharp,
            color: Colors.grey,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Nombre del club",
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //second name field
    final direccionclub = TextFormField(
        autofocus: false,
        keyboardType: TextInputType.name,
        style: TextStyle(color: Colors.black),
        validator: (value) {
          if (value!.isEmpty) {
            return ("Este campo es obligatorio");
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.add_business_rounded,
            color: Colors.grey,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Dirección: Ejemplo: Calle 48 x 173 y 175",
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //email field
    final telefonoclub = TextFormField(
        autofocus: false,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(color: Colors.black),
        validator: (value) {
          if (value!.isEmpty) {
            return ("Este campo es obligatorio");
          }
          // reg expression for email validation
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.phone_sharp,
            color: Colors.grey,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Numero Telefonico",
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //password field
    final horarioclub = TextFormField(
        autofocus: false,
        style: TextStyle(color: Colors.black),
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.date_range,
            color: Colors.grey,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Horario del club : Ejemplo: 12:00pm",
          hintStyle: TextStyle(color: Colors.grey),
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
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => servicios_clubs(),
                ));
          },
          child: Text(
            "Registrar Club",
            textAlign: TextAlign.center,
            style: TextStyle(
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
                    SizedBox(height: 45),
                    nombreclub,
                    SizedBox(height: 20),
                    direccionclub,
                    SizedBox(height: 20),
                    telefonoclub,
                    SizedBox(height: 20),
                    horarioclub,
                    SizedBox(height: 20),
                    siguienteclub,
                    SizedBox(height: 15),
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
