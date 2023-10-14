import 'package:abc_monitor/theme.dart';
import 'package:flutter/material.dart';

class DocumentosPage extends StatefulWidget {
  const DocumentosPage({Key? key}) : super(key: key);

  @override
  State<DocumentosPage> createState() => _DocumentosPageState();
}

class _DocumentosPageState extends State<DocumentosPage> {
  dynamic docs = [
    [
      const Icon(
        Icons.picture_as_pdf,
        color: Colors.white,
      ),
      "Manual_usuario_assinador_desktop.pdf",
    ],
    [
      Icon(
        Icons.picture_as_pdf,
        color: Colors.white,
      ),
      "Mapa Mural do Brasil - 2022.pdf",
    ],
    [
      Icon(
        Icons.picture_as_pdf,
        color: Colors.white,
      ),
      "Disponibilização de crédito de carbono 2023.pdf",
    ],
    [
      Icon(
        Icons.picture_as_pdf,
        color: Colors.white,
      ),
      "Ata de reunião cooperatira.pdf",
    ],
    [
      Icon(
        Icons.image,
        color: Colors.white,
      ),
      "Grupo dos cooperativados.jpeg",
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Documentos'),
        centerTitle: true,
        forceMaterialTransparency: true,
      ),
      body: Column(
        children: [
          Text(
            "Confira abaixo os documentos disponíveis para download.",
          ),
          Container(height: 10),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.5,
              ),
              itemBuilder: (context, int index) {
                return Card(
                  color: AppTheme.kDefaultColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      docs[index % 5][0],
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          docs[index % 5][1],
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
