import 'dart:async';

import 'package:club/Models/Club.dart';
import 'package:club/Providers/ClubProviders.dart';
import 'package:club/screens/clubs.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../Models/ListResponse.dart';

class informacionclub extends StatelessWidget {
  const informacionclub({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //
   final clubProviders = Provider.of<ClubsProvider>(context);
    final ListResponse club = clubProviders.request;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Información Clubs y Servicios",
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
              ...?club.data?.map((club) =>
             Card(
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
                              "Indentificador del torneo:" '${club.idClub}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            subtitle: Text(
                              'Nombre del club: ${club.nombreClub}  Horario del club: ${club.hoarioClub} Dirección del club: ${club.direccion} Telefono del club  : ${club.telefono}',
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


class MapScreen extends StatefulWidget {
  List<Marker> myMarker = [];

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController; //contrller for Google map
  Set<Marker> markers = new Set(); //markers for google map
  static const LatLng showLocation = const LatLng(20.9030849, -89.6182404);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomRight: const Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
        child: Align(
          alignment: Alignment.bottomRight,
          heightFactor: 10,
          widthFactor: 2.5,
          child: GoogleMap(
            zoomGesturesEnabled: true,
            initialCameraPosition: const CameraPosition(
              //innital position in map
              target: showLocation, //initial position
              zoom: 15.0, //initial zoom level
            ),
            markers: getmarkers(), //markers to show on map
            mapType: MapType.normal, //map type
            onMapCreated: (controller) {
              //method called when map is created
              setState(() {
                mapController = controller;
              });
            },
          ),
        ),
      ),
    );
  }

  Set<Marker> getmarkers() {
    //markers to place on map
    setState(() {
      markers.add(Marker(
        //add first marker
        markerId: MarkerId(showLocation.toString()),
        position: showLocation, //position of marker
        infoWindow: const InfoWindow(
          //popup info
          title: 'Club FRUZAZUL',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
    });
    return markers;
  }
}
