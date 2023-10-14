import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class NoticiasPage extends StatefulWidget {
  const NoticiasPage({Key? key}) : super(key: key);

  @override
  State<NoticiasPage> createState() => _NoticiasPageState();
}

class _NoticiasPageState extends State<NoticiasPage> {
  List<dynamic> images = [
    [
      "https://tpc.googlesyndication.com/simgad/5411870909752894687",
      "O Reflexo do Mercado Internacional no Agronegócio Brasileiro | Agro Jovem Podcast",
      "12/10/2023 - 13:22",
    ],
    [
      "https://portaladama.com/wp-content/uploads/2020/08/Guia-da-Soja-capa-1.jpeg",
      "Soja: Plantio atrasado no BR é crítico ponto de atenção de semana de poucos negócios no país",
      "11/10/2023 - 11:30",
    ],
    [
      "https://media-cdn.tripadvisor.com/media/photo-s/1a/f9/e2/8a/pizzaria-hermon.jpg",
      "Soja em Chicago: Fundos ajustam posições, El Niño pode permanecer até março de 2024",
      "09/10/2023 - 08:30",
    ],
    [
      "https://i0.wp.com/souagro.net/wp-content/uploads/2023/03/Umidade-do-milho-para-colheita_Easy-Resize.com_-1.jpg?fit=1280%2C852&ssl=1",
      "Agro e Prosa Episódio 605 - Quebra de safra na Argentina pode beneficiar produtor brasileiro",
      "09/10/2023 - 08:00",
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notícias'),
        centerTitle: true,
        forceMaterialTransparency: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Últimas',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(height: 10),
              FlutterCarousel(
                options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.20,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    viewportFraction: 0.78,
                    showIndicator: true,
                    slideIndicator: const CircularSlideIndicator(),
                    floatingIndicator: false,
                    enableInfiniteScroll: true),
                items: images.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () {
                          //  CustomNavigation.push(context, DetailsScreen(data: i));
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
                                    images[images.indexOf(i)][1],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                Positioned(
                                  right: 8,
                                  bottom: 4,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(images[images.indexOf(i)][2]),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Veja mais',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(height: 10),
              ListView(
                shrinkWrap: true,
                children: [
                  ...images.map(
                    (e) => ListTile(
                      leading: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.network(
                              e[0],
                              fit: BoxFit.cover,
                            ),
                          )),
                      title: Text(
                        e[1],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 14),
                      ),
                      subtitle: Text(
                        e[2],
                        style: Theme.of(context).textTheme.bodySmall!,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
