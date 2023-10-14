import 'package:abc_monitor/theme.dart';
import 'package:flutter/material.dart';

import '../../../widgets/bottom_bar.dart';
import 'documentos_controller.dart';

class DocumentosPage extends StatefulWidget {
  const DocumentosPage({Key? key}) : super(key: key);

  @override
  State<DocumentosPage> createState() => _DocumentosPageState();
}

class _DocumentosPageState extends State<DocumentosPage> {
  List<dynamic> docs = [];
  final controller = DocumentosController();

  @override
  void initState() {
    super.initState();
    controller.getDocumentos().then((value) => {docs = value, setState(() {})});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Documentos'),
        centerTitle: true,
        forceMaterialTransparency: true,
      ),
      bottomNavigationBar: const BottomBar(
        page: BottomBarPage.documentos,
      ),
      body: docs.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                const Text(
                  "Confira abaixo os documentos disponíveis para download.",
                ),
                Container(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
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
