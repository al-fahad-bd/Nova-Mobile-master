import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class StoreMaps extends StatelessWidget {
  const StoreMaps({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterMap(
          options: MapOptions(
              center: LatLng(51.509364, -0.128928), zoom: 10),
          children: [
            TileLayer(
              urlTemplate:
              "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
              userAgentPackageName: "dev.fleaflet.flutter_map.example",
            )
          ]),
    );
  }
}
