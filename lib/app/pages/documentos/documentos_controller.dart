import 'package:flutter/material.dart';

class DocumentosController {
  List<dynamic> data = [
    [
      const Icon(
        Icons.picture_as_pdf,
        color: Colors.white,
      ),
      "Manual_usuario_assinador_desktop.pdf",
    ],
    [
      const Icon(
        Icons.picture_as_pdf,
        color: Colors.white,
      ),
      "Mapa Mural do Brasil - 2022.pdf",
    ],
    [
      const Icon(
        Icons.picture_as_pdf,
        color: Colors.white,
      ),
      "Disponibilização de crédito de carbono 2023.pdf",
    ],
    [
      const Icon(
        Icons.picture_as_pdf,
        color: Colors.white,
      ),
      "Ata de reunião cooperatira.pdf",
    ],
    [
      const Icon(
        Icons.image,
        color: Colors.white,
      ),
      "Grupo dos cooperativados.jpeg",
    ]
  ];

  Future<dynamic> getDocumentos() async {
    await Future.delayed(const Duration(seconds: 1));
    return data;
  }
}
