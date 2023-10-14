import 'package:abc_monitor/app/pages/noticias/leitura_noticia_page.dart';
import 'package:abc_monitor/app/pages/propriedade/propriedade_page.dart';
import 'package:abc_monitor/theme.dart';
import 'package:abc_monitor/widgets/bottom_bar.dart';
import 'package:abc_monitor/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

import '../../../constants.dart';
import '../noticias/noticias_controller.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  List<dynamic> data = [];
  final controller = HomeController();
  final noticiasController = NoticiasController();

  @override
  void initState() {
    super.initState();
    noticiasController.getNoticiasHome().then((value) {
      data = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      bottomNavigationBar: const BottomBar(
        page: BottomBarPage.home,
      ),
      drawer: const AppDrawerWidget(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PropriedadePage();
          }));
        },
        child: Icon(
          Icons.house,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("Acompanhamento de cO2"),
        leading: InkWell(
            onTap: () {
              _key.currentState!.openDrawer();
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const PerfilPage()));
            },
            child: Image.asset(Constants.personAsset)),
        actions: [
          InkWell(
            onTap: () => controller.goToPastagemPage(),
            child: Image.asset(Constants.sininhoAsset),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(height: 30),
                        Container(
                          padding: const EdgeInsets.only(right: 40),
                          decoration: BoxDecoration(
                            color: AppTheme.kDarkGreen.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            height: 15,
                            decoration: BoxDecoration(
                              color: Color(0XFFf9ab6f),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        Container(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "184. Ton",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                            ),
                            Text(
                              "< 200 Ton",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "CO2 em 2023",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                            ),
                            Text(
                              "Meta de emissão",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Image.asset(
                    Constants.carboninhoAsset,
                    scale: 1.5,
                  )
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: AppTheme.kDarkGreen.withOpacity(0.2),
              ),
              Container(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ranking de menores emissões",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    "Ver tudo >",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
              Container(height: 10),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppTheme.kDefaultColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    rankingValue(1, "João da Roça", "11 Ton./Hec. em 2023"),
                    rankingValue(
                        2, "Pedro do Pé Branco", "12 Ton./Hec. em 2023"),
                    rankingValue(
                        3, "Pedro do Pé Preto", "13 Ton./Hec. em 2023"),
                    rankingValue(4, "Pedro do Pé Azul", "14 Ton./Hec. em 2023"),
                    rankingValue(5, "Pedro sem Pé", "15 Ton./Hec. em 2023"),
                  ],
                ),
              ),
              Container(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Notícias",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Container(height: 10),
              FlutterCarousel(
                options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.15,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    viewportFraction: 0.78,
                    showIndicator: true,
                    slideIndicator: const CircularSlideIndicator(),
                    floatingIndicator: false,
                    enableInfiniteScroll: true),
                items: data.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LeituraNoticiaPage(
                                          image: Constants.n1Asset)));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF8A00),
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: NetworkImage(i[0]),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: ClipPath(
                            clipper: ShapeBorderClipper(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Stack(
                              alignment: AlignmentDirectional.bottomStart,
                              children: [
                                Container(
                                  height: 120,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.transparent,
                                        Colors.black,
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Text(
                                    data[data.indexOf(i)][1],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Práticas do ABC+",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Container(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppTheme.kDefaultColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Adicione Irrigação em sua lavoura de café",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: AppTheme.kDarkGreen),
                    ),
                    RichText(
                      text: TextSpan(
                        text: '4',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppTheme.kDefaultColor),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' de 9 Hectares concluídos',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16)),
                        ],
                      ),
                    ),
                    Container(height: 5),
                    Container(
                      padding: const EdgeInsets.only(right: 120),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        height: 10,
                        decoration: BoxDecoration(
                          color: AppTheme.kDefaultColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Container(height: 5),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.kDefaultColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Continuar",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget rankingValue(int valor, String nome, String descricao) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "$valorº",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
                Container(width: 5),
                Text(
                  nome,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ],
            ),
            Text(
              descricao,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white),
            ),
          ],
        ),
        Visibility(
            visible: valor != 5, child: const Divider(color: Colors.white))
      ],
    );
  }
}
