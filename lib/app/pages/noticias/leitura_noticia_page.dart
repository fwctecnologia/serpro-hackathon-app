import 'package:flutter/material.dart';

class LeituraNoticiaPage extends StatefulWidget {
  final String image;
  const LeituraNoticiaPage({Key? key, required this.image}) : super(key: key);

  @override
  State<LeituraNoticiaPage> createState() => _LeituraNoticiaPageState();
}

class _LeituraNoticiaPageState extends State<LeituraNoticiaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ler notícia'),
        centerTitle: true,
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(widget.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(height: 5),
              Text(
                "Plano ABC – Agricultura de Baixa Emissão de Carbono",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
              ),
              Container(height: 10),
              Text(
                "Que há uma enorme preocupação com a emissão de gases do efeito estufa, nós já sabemos, e que a agropecuária é uma das fontes de sua emissão também. Mas você sabia que existe um plano chamado de Plano de Agricultura de Baixa Emissão de Carbono que visa não só reduzir, mas também beneficiar os produtores que aderirem a essas práticas? Vamos entender um pouco mais sobre abaixo:",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
              ),
              Container(height: 5),
              Text(
                "Como surgiu o programa?",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
              ),
              Container(height: 10),
              Text(
                "Entre 2007 e 2009, as negociações da Convenção Quadro das Nações Unidas sobre Mudanças do Clima (CQNUMC) se intensificaram com o objetivo de criar um acordo multilateral que envolvesse todos os países nos esforços para reduzir a concentração de gases de efeito estufa (GEE) na atmosfera, mas foi só em 2010 que as ações se concretizaram com a aprovação do Decreto 7.390 de 9 de dezembro de 2010, prevendo os planos setoriais que seriam a base das ações ligadas a Política Nacional sobre Mudanças do Clima – PNMC.",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
              ),
              Container(height: 5),
              Text(
                "Qual a finalidade do plano nacional da agricultura de baixa emissão de carbono?",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
              ),
              Container(height: 10),
              Text(
                "O objetivo geral do Plano ABC é promover a mitigação da emissão de GEE na agricultura, conforme preconizado na Política Nacional sobre Mudanças do Clima (PNMC) melhorando a eficiência no uso de recursos naturais, aumentando a resiliência de sistemas produtivos e de comunidades rurais e possibilitar a adaptação do setor agropecuário às mudanças climáticas.",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
