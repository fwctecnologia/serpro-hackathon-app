import 'package:abc_monitor/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme.dart';

class TrilhaPage extends StatefulWidget {
  const TrilhaPage({super.key});

  @override
  State<TrilhaPage> createState() => _TrilhaPageState();
}

class _TrilhaPageState extends State<TrilhaPage> {
  final pageController = PageController();
  int totalAcertos = 0;
  int? nineChecked;
  int? tenChecked;
  int? elevenChecked;

  void onNext() {
    setState(() {});
    pageController.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentPage =
        pageController.positions.isNotEmpty ? pageController.page?.toInt() : 0;
    Widget _buildStepIndicator(int index, int currentPage) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            height: 4.5,
            decoration: BoxDecoration(
              color: currentPage >= index
                  ? AppTheme.kDefaultColor
                  : const Color(0xFFBEBEBE),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'Conhecendo o ABC+',
        ),
        actions: [
          GestureDetector(
              onTap: () {
                //   Get.to(() => ConquistasScreen());
              },
              child: Image.asset(
                Constants.setaFrenteAsset,
              )),
          Container(width: 20),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStepIndicator(0, currentPage ?? 0),
                _buildStepIndicator(1, currentPage ?? 0),
                _buildStepIndicator(2, currentPage ?? 0),
                _buildStepIndicator(3, currentPage ?? 0),
                _buildStepIndicator(4, currentPage ?? 0),
                _buildStepIndicator(5, currentPage ?? 0),
                _buildStepIndicator(6, currentPage ?? 0),
                _buildStepIndicator(7, currentPage ?? 0),
                _buildStepIndicator(8, currentPage ?? 0),
                _buildStepIndicator(9, currentPage ?? 0),
                _buildStepIndicator(10, currentPage ?? 0),
                _buildStepIndicator(11, currentPage ?? 0),
              ],
            ),
            const SizedBox(height: 30),
            Expanded(
              child: PageView(
                controller: pageController,
                children: [
                  StepOne(),
                  StepTwo(),
                  StepThree(),
                  StepFour(),
                  StepFive(),
                  StepSix(),
                  StepSeven(),
                  StepEight(),
                  StepNine(
                    onTap: (int n) {
                      nineChecked = n;
                      setState(() {});
                    },
                    checkedNumber: nineChecked,
                  ),
                  StepTen(
                    onTap: (int n) {
                      tenChecked = n;
                      setState(() {});
                    },
                    checkedNumber: tenChecked,
                  ),
                  StepEleven(
                    onTap: (int n) {
                      elevenChecked = n;
                      setState(() {});
                    },
                    checkedNumber: elevenChecked,
                  ),
                  FinishStep(
                    onTap: (int a) {},
                    qtdAcertos: totalAcertos,
                  )
                ],
              ),
            ),
            Visibility(
              visible: (currentPage ?? 0) < 11,
              child: InkWell(
                onTap: () {
                  if (currentPage == 8 && nineChecked == null ||
                      currentPage == 9 && tenChecked == null ||
                      currentPage == 10 && elevenChecked == null) {
                    return;
                  }

                  int nine = nineChecked == 2 ? 2 : 0;
                  int ten = tenChecked == 1 ? 2 : 0;
                  int eleven = elevenChecked == 3 ? 1 : 0;
                  totalAcertos = nine + ten + eleven;
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                  );
                },
                child: Container(
                    height: 65,
                    decoration: BoxDecoration(
                      color: currentPage == 8 && nineChecked == null ||
                              currentPage == 9 && tenChecked == null ||
                              currentPage == 10 && elevenChecked == null
                          ? AppTheme.kDefaultColor.withOpacity(0.5)
                          : AppTheme.kDefaultColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Continuar",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.white, fontSize: 22),
                            textAlign: TextAlign.left,
                          ),
                          Image.asset(
                            Constants.arrowWhiteAsset,
                            color: Colors.white,
                          )
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StepOne extends StatelessWidget {
  const StepOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(height: MediaQuery.of(context).size.height * 0.05),
            Container(
                alignment: AlignmentDirectional.centerStart,
                child: Image.asset(Constants.trilhaThreeAsset)),
            Container(height: 20),
            Text(
              "O que é o ABC +",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Container(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'ABC+ é um plano para tornar a agropecuária mais ',
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: [
                    TextSpan(
                      text: 'sustentável ',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    TextSpan(
                        text: 'e adaptada às mudanças climáticas.\n',
                        style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(
                      text: 'Garantindo ',
                      style: Theme.of(context).textTheme.bodyLarge!,
                    ),
                    TextSpan(
                      text:
                          'melhoria na produção rural e cuidado com o meio ambiente',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class StepTwo extends StatelessWidget {
  const StepTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(height: MediaQuery.of(context).size.height * 0.05),
              // Image.asset("assets/acoes.png"),
              // Container(height: 20),
              Text(
                "Sustentabilidade",
                style: GoogleFonts.robotoCondensed(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  letterSpacing: -1,
                  color: Colors.black,
                ),
              ),
              Container(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        'O ABC+ promove práticas agrícolas que são ambientalmente sustentáveis, contribuindo para a conservação dos recursos naturais, como água e solo.',
                    style: GoogleFonts.robotoCondensed(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    children: [],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StepThree extends StatelessWidget {
  const StepThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(height: MediaQuery.of(context).size.height * 0.05),
              Text(
                "Mitigação das Mudanças Climáticas",
                style: GoogleFonts.robotoCondensed(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  letterSpacing: -1,
                  color: Colors.black,
                ),
              ),
              Container(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        'A agricultura ABC+ ajuda a reduzir as emissões de gases de efeito estufa, ajudando na luta contra as mudanças climáticas.',
                    style: GoogleFonts.robotoCondensed(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    children: [],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StepFour extends StatelessWidget {
  const StepFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(height: MediaQuery.of(context).size.height * 0.05),
              Text(
                "Produtividade Sustentável",
                style: GoogleFonts.robotoCondensed(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  letterSpacing: -1,
                  color: Colors.black,
                ),
              ),
              Container(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        'O ABC+ visa aumentar a produção de alimentos de forma sustentável, atendendo às necessidades atuais sem comprometer as gerações futuras.',
                    style: GoogleFonts.robotoCondensed(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    children: [],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StepFive extends StatelessWidget {
  const StepFive({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(height: MediaQuery.of(context).size.height * 0.05),
              Text(
                "Conservação de Biodiversidade:",
                style: GoogleFonts.robotoCondensed(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  letterSpacing: -1,
                  color: Colors.black,
                ),
              ),
              Container(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        'Práticas como o plantio direto e a rotação de culturas promovem a biodiversidade agrícola, beneficiando a fauna e a flora locais.',
                    style: GoogleFonts.robotoCondensed(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    children: [],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StepSix extends StatelessWidget {
  const StepSix({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(height: MediaQuery.of(context).size.height * 0.05),
              Text(
                "Redução da Erosão do Solo",
                style: GoogleFonts.robotoCondensed(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  letterSpacing: -1,
                  color: Colors.black,
                ),
              ),
              Container(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        'A cobertura permanente do solo ajuda a reduzir a erosão, o que é crucial para manter a fertilidade do solo.',
                    style: GoogleFonts.robotoCondensed(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    children: [],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StepSeven extends StatelessWidget {
  const StepSeven({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(height: MediaQuery.of(context).size.height * 0.05),
              Text(
                "Resiliência Climática",
                style: GoogleFonts.robotoCondensed(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  letterSpacing: -1,
                  color: Colors.black,
                ),
              ),
              Container(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        'O ABC+ ajuda os agricultores a lidar com eventos climáticos extremos, tornando seus sistemas agrícolas mais resilientes',
                    style: GoogleFonts.robotoCondensed(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    children: [],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StepEight extends StatelessWidget {
  const StepEight({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(height: MediaQuery.of(context).size.height * 0.05),
              Text(
                "Adoção Global",
                style: GoogleFonts.robotoCondensed(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  letterSpacing: -1,
                  color: Colors.black,
                ),
              ),
              Container(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        'O conceito de ABC+ está se espalhando globalmente, com vários países adotando essas práticas para melhorar a sustentabilidade e a produtividade da agricultura.',
                    style: GoogleFonts.robotoCondensed(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    children: [],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StepNine extends StatelessWidget {
  final Function(int n) onTap;
  final int? checkedNumber;

  const StepNine({
    super.key,
    required this.onTap,
    required this.checkedNumber,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "O que é o ABC+?",
              style: GoogleFonts.robotoCondensed(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                height: 28 / 24,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            CheckBoxOption(
              title: "Um lugar para comprar e vender produtos agropecuários",
              onTap: onTap,
              number: 0,
              checkedNumber: checkedNumber,
            ),
            CheckBoxOption(
              title: "Um agrotóxico que ajuda a combater pragas",
              onTap: onTap,
              number: 1,
              checkedNumber: checkedNumber,
            ),
            CheckBoxOption(
              title: "Práticas agrícolas que são ambientalmente sustentáveis",
              onTap: onTap,
              number: 2,
              checkedNumber: checkedNumber,
            ),
            CheckBoxOption(
              title: "Um fertilizante que ajuda a aumentar a produtividade",
              onTap: onTap,
              number: 3,
              checkedNumber: checkedNumber,
            ),
            CheckBoxOption(
              title: "Nenhuma das alternativas",
              onTap: onTap,
              number: 4,
              checkedNumber: checkedNumber,
            ),
          ],
        ),
      ),
    );
  }
}

class StepTen extends StatelessWidget {
  final Function(int n) onTap;
  final int? checkedNumber;

  const StepTen({
    super.key,
    required this.onTap,
    required this.checkedNumber,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Como o ABC+ contribui para a mitigação das mudanças climáticas?",
              style: GoogleFonts.robotoCondensed(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                height: 28 / 24,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            CheckBoxOption(
              title: "Aumentando o uso de combustíveis fósseis",
              onTap: onTap,
              number: 0,
              checkedNumber: checkedNumber,
            ),
            CheckBoxOption(
              title: "Promovendo práticas agrícolas intensivas em água",
              onTap: onTap,
              number: 1,
              checkedNumber: checkedNumber,
            ),
            CheckBoxOption(
              title:
                  "Diminuindo as emissões de gases de efeito estufa na agricultura",
              onTap: onTap,
              number: 2,
              checkedNumber: checkedNumber,
            ),
            CheckBoxOption(
              title: "Reduzindo a biodiversidade",
              onTap: onTap,
              number: 3,
              checkedNumber: checkedNumber,
            ),
            CheckBoxOption(
              title: "Incentivando o desmatamento",
              onTap: onTap,
              number: 4,
              checkedNumber: checkedNumber,
            ),
          ],
        ),
      ),
    );
  }
}

class StepEleven extends StatelessWidget {
  final Function(int n) onTap;
  final int? checkedNumber;

  const StepEleven({
    super.key,
    required this.onTap,
    required this.checkedNumber,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Complete a frase: Com o ABC+ eu tenho....",
              style: GoogleFonts.robotoCondensed(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                height: 28 / 24,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            CheckBoxOption(
              title: "...mais produtividade",
              onTap: onTap,
              number: 0,
              checkedNumber: checkedNumber,
            ),
            CheckBoxOption(
              title: "...aumento de fertilidade do solo",
              onTap: onTap,
              number: 1,
              checkedNumber: checkedNumber,
            ),
            CheckBoxOption(
              title: "...o controle de pragas",
              onTap: onTap,
              number: 2,
              checkedNumber: checkedNumber,
            ),
            CheckBoxOption(
              title: "...um aumento a sustentabilidade",
              onTap: onTap,
              number: 3,
              checkedNumber: checkedNumber,
            ),
            CheckBoxOption(
              title: "Nenhuma das alternativas se encaixa",
              onTap: onTap,
              number: 4,
              checkedNumber: checkedNumber,
            ),
          ],
        ),
      ),
    );
  }
}

class FinishStep extends StatelessWidget {
  final Function(int n) onTap;
  final int qtdAcertos;

  const FinishStep({
    super.key,
    required this.onTap,
    required this.qtdAcertos,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "APROVADO",
              style: GoogleFonts.robotoCondensed(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.green),
            ),
            // Image.asset("assets/result.png"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  qtdAcertos.toString(),
                  style: GoogleFonts.robotoCondensed(
                      fontSize: 64,
                      fontWeight: FontWeight.w700,
                      color: Colors.green),
                ),
                Text(
                  " / 3",
                  style: GoogleFonts.robotoCondensed(
                      fontSize: 64, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Text(
              "Respostas corretas",
              style: GoogleFonts.robotoCondensed(
                  fontSize: 22, fontWeight: FontWeight.w700),
            ),
            Container(height: 60),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Usar o Aplicativo',
                  style: GoogleFonts.robotoCondensed(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckBoxOption extends StatefulWidget {
  final String title;
  final Function(int n) onTap;
  final int number;
  final int? checkedNumber;

  const CheckBoxOption({
    super.key,
    required this.title,
    required this.onTap,
    required this.number,
    required this.checkedNumber,
  });

  @override
  State<CheckBoxOption> createState() => _CheckBoxOptionState();
}

class _CheckBoxOptionState extends State<CheckBoxOption> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap(widget.number);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: widget.checkedNumber == widget.number
                ? Colors.black
                : Color.fromARGB(255, 106, 106, 106),
          ),
          color: widget.checkedNumber == widget.number
              ? Colors.white12
              : Colors.transparent,
        ),
        child: Row(
          children: [
            Checkbox(
              value: widget.checkedNumber == widget.number,
              onChanged: (v) {
                widget.onTap(widget.number);
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  widget.title,
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: widget.checkedNumber == widget.number
                        ? Colors.black
                        : Color.fromARGB(255, 106, 106, 106),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
