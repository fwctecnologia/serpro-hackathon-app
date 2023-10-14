import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe8f3ed),
      appBar: AppBar(
        title: const Text("SERPRO - ABC+ Estatísticas"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 300,
                child: Stack(
                  children: [
                    FlutterMap(
                      options: MapOptions(
                        // -3.5403269,-62.1869208
                        center: const LatLng(-3.227286, -60.358110),
                        zoom: 7,
                        maxZoom: 18,
                      ),
                      nonRotatedChildren: [],
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://khms2.google.com/kh/v=959?x={x}&y={y}&z={z}',
                          userAgentPackageName: 'com.example.app',
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              width: 100.0,
                              height: 100.0,
                              point: const LatLng(-1.227286, -58.358110),
                              builder: (ctx) => const Icon(
                                Icons.eco_outlined,
                                size: 40,
                                color: Colors.red,
                                shadows: [
                                  Shadow(
                                    blurRadius: 4,
                                    color: Colors.black26,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                            ),
                            Marker(
                              width: 100.0,
                              height: 100.0,
                              point: const LatLng(-2.116286, -58.117110),
                              builder: (ctx) => const Icon(
                                Icons.eco_outlined,
                                size: 40,
                                color: Colors.red,
                                shadows: [
                                  Shadow(
                                    blurRadius: 4,
                                    color: Colors.black26,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                            ),
                            Marker(
                              width: 100.0,
                              height: 100.0,
                              point: const LatLng(-3.223236, -60.354110),
                              builder: (ctx) => const Icon(
                                Icons.eco_outlined,
                                size: 40,
                                color: Colors.orange,
                                shadows: [
                                  Shadow(
                                    blurRadius: 4,
                                    color: Colors.black26,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                            ),
                            Marker(
                              width: 100.0,
                              height: 100.0,
                              point: const LatLng(-1.223236, -57.354110),
                              builder: (ctx) => const Icon(
                                Icons.eco_outlined,
                                size: 40,
                                color: Colors.green,
                                shadows: [
                                  Shadow(
                                    blurRadius: 4,
                                    color: Colors.black26,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                            ),
                            Marker(
                              width: 100.0,
                              height: 100.0,
                              point: const LatLng(-1.823236, -56.954110),
                              builder: (ctx) => const Icon(
                                Icons.eco_outlined,
                                size: 40,
                                color: Colors.green,
                                shadows: [
                                  Shadow(
                                    blurRadius: 4,
                                    color: Colors.black26,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Wrap(
            children: [
              Card(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text(
                        "Regular",
                        style: TextStyle(fontSize: 22),
                      ),
                      Text(
                        "109",
                        style: TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text(
                        "Alerta",
                        style: TextStyle(fontSize: 22),
                      ),
                      Text(
                        "7",
                        style: TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text(
                        "Ruim",
                        style: TextStyle(fontSize: 22),
                      ),
                      Text(
                        "3",
                        style: TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
