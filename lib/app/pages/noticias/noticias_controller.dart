class NoticiasController {
  List<dynamic> data = [
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

  Future<dynamic> getNoticias() async {
    await Future.delayed(const Duration(seconds: 1));
    return data;
  }
}
