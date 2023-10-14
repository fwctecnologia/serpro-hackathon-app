import 'package:abc_monitor/pages/cadastrar_propriedade/cadastrar_propriedade_screen.dart';
import 'package:flutter/material.dart';

enum BottomBarPage { home, noticias, pastagem, documentos }

class BottomBar extends StatelessWidget {
  final BottomBarPage page;
  const BottomBar({
    super.key,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      padding: const EdgeInsets.only(bottom: 30, top: 10),
      decoration: const BoxDecoration(
        color: Color(0xFFd0e8dd),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const CadastrarPropriedadeScreen(),
                ),
              );
            },
            child: CircleAvatar(
              backgroundColor:
                  page == BottomBarPage.home ? const Color(0xFF509f7e) : null,
              radius: 50,
              child: Image.asset(
                "assets/home.png",
                scale: 1,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const CadastrarPropriedadeScreen(),
                ),
              );
            },
            child: CircleAvatar(
              backgroundColor: page == BottomBarPage.noticias
                  ? const Color(0xFF509f7e)
                  : Color(0xFFd0e8dd),
              radius: 45,
              child: Image.asset(
                "assets/jornal.png",
                scale: 1.1,
                color: page != BottomBarPage.noticias
                    ? Colors.black
                    : Color(0xFFd0e8dd),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const CadastrarPropriedadeScreen(),
                ),
              );
            },
            child: CircleAvatar(
              backgroundColor: page == BottomBarPage.pastagem
                  ? const Color(0xFF509f7e)
                  : Color(0xFFd0e8dd),
              radius: 45,
              child: Image.asset(
                "assets/mapa.png",
                scale: 1.1,
                color: page != BottomBarPage.pastagem
                    ? Colors.black
                    : Color(0xFFd0e8dd),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const CadastrarPropriedadeScreen(),
                ),
              );
            },
            child: CircleAvatar(
              backgroundColor: page == BottomBarPage.documentos
                  ? const Color(0xFF509f7e)
                  : Color(0xFFd0e8dd),
              radius: 45,
              child: Image.asset(
                "assets/checklist.png",
                scale: 1.1,
                color: page != BottomBarPage.documentos
                    ? Colors.black
                    : Color(0xFFd0e8dd),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
