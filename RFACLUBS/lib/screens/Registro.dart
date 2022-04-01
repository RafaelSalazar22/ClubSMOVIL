import 'package:club/Models/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../Models/ListResponse.dart';
import '../Providers/UserProviders.dart';
import 'login.dart';

class Registro extends StatefulWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<Registro> {
  // our form key
  final _formKey = GlobalKey<FormState>();
  // editing Controller

  @override
  Widget build(BuildContext context) {
     final Usuario usuario1 = Usuario(
      idUser: 0,
    );
    final userProviders = Provider.of<UserProviders>(context);
    final ListResponse usuario = userProviders.request;
    //first name field
    final firstNameField = TextFormField(
        autofocus: true,
        keyboardType: TextInputType.name,
        initialValue: usuario1.nombre,
        onChanged: (value) =>  usuario1.nombre = value,
        style: const TextStyle(color: Colors.black),
        validator: (value) {
          RegExp regex = RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("El nombre no puede estar vacío");
          }
          if (!regex.hasMatch(value)) {
            return ("Ingrese un nombre válido (mín. 3 caracteres)");
          }
          if (value.length > 20) {
            return ("No  puede escribir mas de  20 caracteres.");
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.account_circle,
            color: Colors.grey,
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Nombre",
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //second name field
    final secondNameField = TextFormField(
       initialValue: usuario1.apellidos,
        onChanged: (value) =>  usuario1.apellidos = value,
        autofocus: false,
        keyboardType: TextInputType.name,
        style: const TextStyle(color: Colors.black),
        validator: (value) {
          // ignore: unused_local_variable
          RegExp regex = RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("El Apellido no puede estar vacío");
          }
          if (!regex.hasMatch(value)) {
            return ("Ingrese un nombre válido (mín. 3 caracteres)");
          }
          if (value.length > 20) {
            return ("No  puede escribir mas de  20 caracteres.");
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.account_circle,
            color: Colors.grey,
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Apellidos",
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //email field
    final emailField = TextFormField(
       initialValue: usuario1.correo,
        onChanged: (value) =>  usuario1.correo = value,
        autofocus: false,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(color: Colors.black),
        validator: (value) {
          if (value!.isEmpty) {
            return ("Por favor introduzca su correo electrónico");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Por favor introduzca una dirección de correo electrónico válida");
          }
          if (value.length > 40) {
            return ("No  puede escribir mas de  40 caracteres.");
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.mail,
            color: Colors.grey,
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Correo Electrónico ",
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //password field
    final passwordField = TextFormField(
          initialValue: usuario1.password,
        onChanged: (value) =>  usuario1.password = value,
        autofocus: false,
        obscureText: true,
        style: const TextStyle(color: Colors.black),
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Se requiere contraseña para iniciar sesión");
          }
          if (!regex.hasMatch(value)) {
            return ("Introduzca una contraseña válida (mín. 6 caracteres)");
          }
          if (value.length > 12) {
            return ("No  puede escribir mas de  12 caracteres.");
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.vpn_key,
            color: Colors.grey,
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Contraseña ",
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //confirm password field
    //signup button
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Colors.redAccent,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              userProviders.post(usuario1);
              if (userProviders.request.exito == 1) {
                Scaffold.of(context)
                    // ignore: deprecated_member_use, unnecessary_const
                    .showSnackBar(const SnackBar(
                        content: Text('El Usuario se  agrego exitosamente')));
                 Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const loginScreen(),
                    ));
              } 
              else {
                Scaffold.of(context)
                    // ignore: deprecated_member_use, unnecessary_const
                    .showSnackBar(const SnackBar(
                        content: Text('El Usuario no se  agrego exitosamente')));
              }
               
              
            }
          },
          child: const Text(
            "Registrar",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {
            // passing this to our root
            Navigator.of(context).pop();
          },
        ),
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
                    firstNameField,
                    const SizedBox(height: 20),
                    secondNameField,
                    const SizedBox(height: 20),
                    emailField,
                    const SizedBox(height: 20),
                    passwordField,
                    const SizedBox(height: 20),
                    signUpButton,
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
