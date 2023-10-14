import 'package:abc_monitor/constants.dart';
import 'package:abc_monitor/theme.dart';
import 'package:abc_monitor/web/pages/destinations_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  void handleLogin() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Flex(
          direction: Axis.horizontal,
          children: [
            Flexible(
              flex: 3,
              child: Container(
                width: double.infinity,
                color: Colors.green,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    const Icon(Icons.eco_outlined,
                        size: 90, color: Colors.white),
                    const Text(
                      "SERPRO ABC+",
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: Center(
                child: SizedBox(
                  width: 400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (!isLoading)
                        const Text(
                          "Painel do administrador",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 22,
                          ),
                        ),
                      const SizedBox(height: 10),
                      Center(
                        child: isLoading
                            ? CircularProgressIndicator()
                            : SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: AppTheme.kLightGreen,
                                    side: const BorderSide(
                                      color: AppTheme.kDefaultColor,
                                      width: 2,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isLoading = true;
                                    });

                                    Future.delayed(Duration(seconds: 3), () {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const DestinationsScreen(),
                                        ),
                                      );
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Entrar com',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                      ),
                                      Container(width: 5),
                                      Image.asset(
                                        Constants.logotipoGovBrAsset,
                                        scale: 23.7,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      ),
                      const SizedBox(height: 15),
                      // isLoading
                      //     ? const CircularProgressIndicator()
                      //     : ElevatedButton(
                      //         style: ElevatedButton.styleFrom(
                      //           backgroundColor: ThemeConfig.kYellowColor,
                      //           foregroundColor: Colors.black,
                      //         ),
                      //         onPressed: handleLogin,
                      //         child: const Text("Entrar"),
                      //       )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
