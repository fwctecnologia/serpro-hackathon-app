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
          SizedBox(
            height: MediaQuery.of(context).size.height - 56,
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                FlutterMap(
                  options: MapOptions(
                    // -3.5403269,-62.1869208
                    center: const LatLng(-3.227286, -60.358110),
                    zoom: 7,
                    maxZoom: 7,
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
                          width: 500.0,
                          height: 500.0,
                          anchorPos: AnchorPos.align(AnchorAlign.top),
                          point: const LatLng(-1.227286, -58.358110),
                          builder: (ctx) => Image.asset(
                            "assets/dados.png",
                          ),
                        ),
                        Marker(
                          width: 500.0,
                          height: 500.0,
                          anchorPos: AnchorPos.align(AnchorAlign.top),
                          point: const LatLng(-4.227286, -61.358110),
                          builder: (ctx) => Image.asset(
                            "assets/dados.png",
                          ),
                        ),
                        Marker(
                          width: 500.0,
                          height: 500.0,
                          anchorPos: AnchorPos.align(AnchorAlign.top),
                          point: const LatLng(-8.227286, -63.358110),
                          builder: (ctx) => Image.asset(
                            "assets/dados.png",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8.0),
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Color(0xFFc48b96),
                                  shape: BoxShape.circle,
                                ),
                                child: SizedBox(),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Pastagem em sistema agroflorestal",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              )
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8.0),
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Color(0xFF7eb1d6),
                                  shape: BoxShape.circle,
                                ),
                                child: SizedBox(),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Lavouras em sistema agroflorestal",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              )
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8.0),
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Color(0xFFf7ccac),
                                  shape: BoxShape.circle,
                                ),
                                child: SizedBox(),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Lavouras de plantio direto",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
