import 'package:abc_monitor/model/propriedade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';

class CadastrarPropriedadePage extends StatefulWidget {
  const CadastrarPropriedadePage({super.key});

  @override
  State<CadastrarPropriedadePage> createState() =>
      _CadastrarPropriedadePageState();
}

class _CadastrarPropriedadePageState extends State<CadastrarPropriedadePage> {
  final pageController = PageController();
  final nomeTec = TextEditingController();

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      setState(() {});
    });
  }

  void onSkip() {
    Navigator.of(context).pop();
  }

  void onNext() {
    FocusScope.of(context).unfocus();

    pageController.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentPage =
        pageController.positions.isNotEmpty ? pageController.page?.toInt() : 0;

    Widget _buildStepIndicator(int index, int currentPage) {
      return Container(
        width: MediaQuery.of(context).size.width * 0.20,
        height: 4.5,
        decoration: BoxDecoration(
          color: currentPage >= index
              ? const Color(0xFF509f7e)
              : const Color(0xFFBEBEBE),
          borderRadius: BorderRadius.circular(12),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar Propriedade"),
        forceMaterialTransparency: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStepIndicator(0, currentPage ?? 0),
                _buildStepIndicator(1, currentPage ?? 0),
                _buildStepIndicator(2, currentPage ?? 0),
                _buildStepIndicator(3, currentPage ?? 0),
                // _buildStepIndicator(4, currentPage ?? 0),
                // _buildStepIndicator(5, currentPage ?? 0),
              ],
            ),
            const SizedBox(height: 30),
            Expanded(
              child: PageView(
                controller: pageController,
                children: [
                  StepOne(tec: nomeTec),
                  StepTwo(),
                  StepThree(),
                  StepFour(),
                  // StepFive(),
                  // StepSix(),
                ],
              ),
            ),
            if (currentPage != 3) ...[
              InkWell(
                onTap: onNext,
                child: Container(
                    height: 65,
                    decoration: const BoxDecoration(
                      color: Color(0xFF509f7e),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Continuar",
                            style: GoogleFonts.robotoCondensed(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              height: 28 / 24,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const Icon(Icons.arrow_forward)
                        ],
                      ),
                    )),
              )
              // CustomElevatedButton(
              //   text: currentPage == 0 ? "INICIAR" : "PRÓXIMO",
              //   onPressed: onNext,
              // ),
              // TextButton(
              //   onPressed: onSkip,
              //   child: const Text(
              //     "Pular",
              //     // fontWeight: FontWeight.w300,
              //     // decoration: TextDecoration.underline,
              //   ),
              // ),
            ],
            if (currentPage == 3) ...[
              InkWell(
                onTap: () {
                  // Navigator.of(context).pushReplacement(
                  //   MaterialPageRoute(
                  //     builder: (context) => const NovaGraninhaScreen(),
                  //   ),
                  // );

                  final propriedade = Propriedade(
                    nome: nomeTec.text,
                    cidade: "Barreirinha",
                    estado: "AM",
                    atividades: ["Café"],
                    praticasAbc: 3,
                    hectares: 40,
                    porcentagemAreaVerde: 30,
                  );

                  Navigator.of(context).pop(propriedade);
                },
                child: Container(
                    height: 65,
                    decoration: const BoxDecoration(
                      color: Color(0xFF509f7e),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Finalizar",
                            style: GoogleFonts.robotoCondensed(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              height: 28 / 24,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const Icon(Icons.arrow_forward)
                        ],
                      ),
                    )),
              )
            ],
          ],
        ),
      ),
    );
  }
}

class StepOne extends StatelessWidget {
  final TextEditingController tec;
  const StepOne({
    super.key,
    required this.tec,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Qual o nome da propriedade?",
            style: GoogleFonts.robotoCondensed(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: tec,
            autofocus: true,
            style: GoogleFonts.robotoCondensed(
              fontSize: 26,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              height: 28 / 24,
            ),
            decoration: InputDecoration(
                hintText: "Digite seu nome ou apelido",
                filled: false,
                border: InputBorder.none,
                hintStyle: GoogleFonts.robotoCondensed(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xffbebebe),
                  height: 28 / 24,
                )),
          ),
        ],
      ),
    );
  }
}

class StepTwo extends StatefulWidget {
  const StepTwo({super.key});

  @override
  State<StepTwo> createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> {
  LatLng? _lastTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Defina a área da propriedade",
            style: GoogleFonts.robotoCondensed(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              height: 28 / 24,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            "Toque no mapa para inserir pontos e delimitar sua propriedade",
            style: GoogleFonts.robotoCondensed(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Colors.black45,
              height: 28 / 24,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 300,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: FlutterMap(
                options: MapOptions(
                  // -3.5403269,-62.1869208
                  center: const LatLng(-3.227286, -60.358110),
                  zoom: 18,
                  maxZoom: 18,
                  onTap: (tapPosition, point) {
                    setState(() {
                      _lastTap = point;
                    });
                  },
                ),
                nonRotatedChildren: [],
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://khms2.google.com/kh/v=959?x={x}&y={y}&z={z}',
                    userAgentPackageName: 'com.example.app',
                  ),
                  MarkerLayer(
                    markers: [
                      if (_lastTap != null)
                        Marker(
                            width: 100.0,
                            height: 100.0,
                            point: _lastTap!,
                            builder: (ctx) => Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Adicione um ponto tocando no mapa",
            style: GoogleFonts.robotoCondensed(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Colors.black45,
              height: 28 / 24,
            ),
          )
        ],
      ),
    );
  }
}

class StepThree extends StatefulWidget {
  const StepThree({super.key});

  @override
  State<StepThree> createState() => _StepThreeState();
}

class _StepThreeState extends State<StepThree> {
  bool? q1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Você pratica Agricultura nesta área?",
              style: GoogleFonts.robotoCondensed(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                height: 28 / 24,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      q1 = true;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 50),
                    decoration: BoxDecoration(
                      color: q1 != null && q1! == true
                          ? const Color(0xFF509f7e)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xFF509f7e),
                        width: 3,
                      ),
                    ),
                    child: Text(
                      "Sim",
                      style: TextStyle(
                          fontSize: 30,
                          color: (q1 != null && q1! == true)
                              ? Colors.white
                              : Color(0xFF509f7e)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      q1 = false;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 50),
                    decoration: BoxDecoration(
                      color: q1 != null && q1! == false
                          ? const Color(0xFF509f7e)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xFF509f7e),
                        width: 3,
                      ),
                    ),
                    child: Text(
                      "Não",
                      style: TextStyle(
                          fontSize: 30,
                          color: (q1 != null && q1! == false)
                              ? Colors.white
                              : Color(0xFF509f7e)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StepFour extends StatelessWidget {
  const StepFour({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Image.asset("assets/ia.png"),
            const SizedBox(height: 20),
            Text(
              "Aguarde enquanto nossa Inteligência Artificial processa os dados da sua propriedade",
              style: GoogleFonts.robotoCondensed(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                height: 28 / 24,
              ),
              textAlign: TextAlign.center,
            ),
            // const SizedBox(height: 10),
            // Text(
            //   "Se ainda não usa nenhum, pode passar",
            //   style: GoogleFonts.robotoCondensed(
            //     fontSize: 20,
            //     fontWeight: FontWeight.w600,
            //     height: 23 / 20,
            //   ),
            //   textAlign: TextAlign.left,
            // ),
            // const SizedBox(height: 20),
            // const CheckBoxOption(title: "Cartão de crédito"),
            // const CheckBoxOption(title: "Conta corrente"),
            // const CheckBoxOption(title: "Pix"),
            // const CheckBoxOption(title: "Pagamento por aproximação"),
            // const CheckBoxOption(title: "Google Wallet ou Apple Pay"),
            // const CheckBoxOption(title: "Linhas de crédito"),
          ],
        ),
      ),
    );
  }
}

class StepFive extends StatelessWidget {
  const StepFive({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Quais desses você quer usar?",
              style: GoogleFonts.robotoCondensed(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                height: 28 / 24,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              "Selecione todos os que você se interessa",
              style: GoogleFonts.robotoCondensed(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                height: 23 / 20,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20),
            const CheckBoxOption(title: "Cartão de crédito"),
            const CheckBoxOption(title: "Conta corrente"),
            const CheckBoxOption(title: "Pix"),
            const CheckBoxOption(title: "Pagamento por aproximação"),
            const CheckBoxOption(title: "Google Wallet ou Apple Pay"),
            const CheckBoxOption(title: "Linhas de crédito"),
          ],
        ),
      ),
    );
  }
}

class StepSix extends StatelessWidget {
  const StepSix({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Você ganhou uma Graninha!!!  🤑",
            style: GoogleFonts.robotoCondensed(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              height: 28 / 24,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Image.asset(
            "assets/motivacional.png",
            scale: 0.8,
          ),
          const SizedBox(height: 40),
          Text(
            "\"Graninhas” são nossos personagens colecionáveis.",
            style: GoogleFonts.robotoCondensed(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Text(
            "Ganhe Graninhas ao completar desafios e desbloquear conquistas no App",
            style: GoogleFonts.robotoCondensed(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

class CheckBoxOption extends StatefulWidget {
  final String title;
  const CheckBoxOption({
    super.key,
    required this.title,
  });

  @override
  State<CheckBoxOption> createState() => _CheckBoxOptionState();
}

class _CheckBoxOptionState extends State<CheckBoxOption> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _checked = !_checked;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _checked ? Colors.white : const Color(0xffbebebe),
          ),
          color: _checked ? Colors.white12 : Colors.transparent,
        ),
        child: Row(
          children: [
            Checkbox(
              value: _checked,
              onChanged: (v) {
                setState(() {
                  _checked = v!;
                });
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.title,
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: _checked ? Colors.white : const Color(0xffbebebe),
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
