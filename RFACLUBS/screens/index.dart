import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
        //first name field
    final firstNameField = TextFormField(
        autofocus: true,
        keyboardType: TextInputType.name,
        style: TextStyle(color: Colors.black),
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("First Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle, color: Colors.grey,),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Nombre",
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //second name field
    final secondNameField = TextFormField(
        autofocus: false,
        keyboardType: TextInputType.name,
        style: TextStyle(color: Colors.black),
        validator: (value) {
          if (value!.isEmpty) {
            return ("Second Name cannot be Empty");
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle, color: Colors.grey,),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Apellidos",
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //email field
    final emailField = TextFormField(
        autofocus: false,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(color: Colors.black),
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail, color: Colors.grey, ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Correo Electrónico ",
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        obscureText: true,
        style: TextStyle(color: Colors.black),
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key, color: Colors.grey,),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Contraseña ",
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //confirm password field
    final confirmPasswordField = TextFormField(
        autofocus: false,
        obscureText: true,
        style: TextStyle(color: Colors.black),
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key, color: Colors.grey,),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirmar la contraseña anterior",
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //signup button
    final signUpButton = Material(
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
                  builder: (context) => loginScreen(),
                ));
          },
          child: Text(
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
          icon: Icon(Icons.arrow_back, color: Colors.red),
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
                    SizedBox(height: 45),
                    firstNameField,
                    SizedBox(height: 20),
                    secondNameField,
                    SizedBox(height: 20),
                    emailField,
                    SizedBox(height: 20),
                    passwordField,
                    SizedBox(height: 20),
                    confirmPasswordField,
                    SizedBox(height: 20),
                    signUpButton,
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
