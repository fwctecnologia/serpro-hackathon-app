import 'package:abc_monitor/app/pages/noticias/noticias_controller.dart';
import 'package:abc_monitor/constants.dart';
import 'package:flutter/material.dart';

import '../../../widgets/bottom_bar.dart';
import 'leitura_noticia_page.dart';

class NoticiasPage extends StatefulWidget {
  const NoticiasPage({Key? key}) : super(key: key);

  @override
  State<NoticiasPage> createState() => _NoticiasPageState();
}

class _NoticiasPageState extends State<NoticiasPage> {
  List<dynamic> data = [];
  final controller = NoticiasController();

  @override
  void initState() {
    super.initState();
    controller.getNoticias().then((value) {
      data = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notícias'),
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
        page: BottomBarPage.noticias,
      ),
      body: Center(
        child: data.isEmpty
            ? const CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ...data.map((e) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LeituraNoticiaPage(
                                            image: e,
                                          )));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(e),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
