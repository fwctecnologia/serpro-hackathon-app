import 'package:abc_monitor/theme.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../widgets/bottom_bar.dart';
import '../../../widgets/card_conquistas_widget.dart';
import 'documentos_controller.dart';
import 'documentos_page.dart';

class DocumentosInformativosPage extends StatefulWidget {
  const DocumentosInformativosPage({Key? key}) : super(key: key);

  @override
  State<DocumentosInformativosPage> createState() =>
      _DocumentosInformativosPageState();
}

class _DocumentosInformativosPageState
    extends State<DocumentosInformativosPage> {
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
        title: const Text('Documentos e Práticas'),
        centerTitle: true,
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        leading: Image.asset(Constants.personAsset),
        actions: [
          InkWell(
            onTap: () {},
            child: Image.asset(Constants.sininhoAsset),
          ),
        ],
      ),
      bottomNavigationBar: const BottomBar(
        page: BottomBarPage.documentos,
      ),
      body: docs.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Documentos e informativos',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DocumentosPage()));
                          },
                          child: Text(
                            'Ver todos >',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        ),
                      ],
                    ),
                    Container(height: 10),
                    Container(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: docs.length,
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
                    ),
                    Container(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Práticas do ABC+',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Container(height: 10),
                    const CardConquistasWidget(
                      titulo: 'Adicione Irrigação em sua lavoura de café',
                      descricao: ' de 9 Hectares concluídos',
                      quantidade: 5,
                    ),
                    const CardConquistasWidget(
                      titulo: 'Integre sua Lavoura com a Floresta (SAF)',
                      descricao: ' de 5 Hectares concluídos',
                      quantidade: 1,
                    ),
                    const CardConquistasWidget(
                      titulo: 'Utilize plantio direto na sua Lavoura de Soja',
                      descricao: ' de 6 Hectares concluídos',
                      quantidade: 0,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
