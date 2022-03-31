import 'package:club/Providers/ClubProviders.dart';
import 'package:club/Providers/TorneoProviders.dart';
import 'package:club/screens/Torneo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../Models/Torneo.dart';

class informaciontorneo extends StatelessWidget {
  const informaciontorneo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //
    final torneoProviders = Provider.of<TorneoProviders>(context);
    final List<Torneo> torneo = torneoProviders.torneo;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Información  de los Torneos",
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
            child: Center(
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
                ...torneo.map(
                  (torneo) => Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      margin: const EdgeInsets.all(20),
                      elevation: 10,
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            contentPadding:
                                const EdgeInsets.fromLTRB(15, 10, 25, 0),
                            title: Text(
                              "Indentificador del torneo:" '${torneo.idTorneo}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            subtitle: Text(
                              'Nombre del torneo: ${torneo.nombreTorneo}  Horario del torneo: ${torneo.horario} Dirección del torneo: ${torneo.direccion} Diciplina del Torneo : ${torneo.diciplina} Cantidad de equipos particpantes : ${torneo.cantidadEquipos} Cantidad de rondas : ${torneo.cantidadRondas} ¿Aceptan personas Discpacitdad? : ${torneo.personasEspeciales}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            leading: const Icon(Icons.zoom_out_map_rounded,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              TextButton.icon(
                                icon: const Icon(Icons.visibility,
                                    size: 20.0,
                                    color: Color.fromARGB(255, 153, 162, 152)),
                                label: const Text(
                                  'Ver Info',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 2, 3),
                                  ),
                                ),
                                onPressed: () {
                                  ('Confirmación');
                                },
                              ),
                              TextButton.icon(
                                icon: const Icon(Icons.edit,
                                    size: 20.0,
                                    color: Color.fromARGB(255, 241, 196, 74)),
                                label: const Text(
                                  'Editar',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 2, 3),
                                  ),
                                ),
                                onPressed: () {
                                  ('Confirmación');
                                },
                              ),
                              TextButton.icon(
                                icon: const Icon(Icons.delete_forever,
                                    size: 20.0,
                                    color: Color.fromARGB(255, 240, 68, 68)),
                                label: const Text(
                                  'Eliminar',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 2, 3),
                                  ),
                                ),
                                onPressed: () {
                                  ('Rechazo');
                                },
                              ),
                            ],
                          ),
                        ],
                      )),
                )
              ]),
        )));
  }
}
