import 'package:abc_monitor/web/pages/destinations/arquivos_destination.dart';
import 'package:abc_monitor/web/pages/destinations/noticias_destination.dart';
import 'package:abc_monitor/web/pages/destinations/notificacoes_destination.dart';
import 'package:abc_monitor/web/pages/destinations/usuarios_destination.dart';
import 'package:abc_monitor/web/tables/noticias_table.dart';
import 'package:flutter/material.dart';

typedef WidgetCallback = Widget Function();

class DestinationsScreen extends StatefulWidget {
  const DestinationsScreen({Key? key}) : super(key: key);

  @override
  State<DestinationsScreen> createState() => _DestinationsScreenState();
}

class _DestinationsScreenState extends State<DestinationsScreen> {
  // final storage = AuthStorage();
  int currentDestinationIndex = 0;
  late List<WidgetCallback?> destinations = [
    () => const UsuariosDestination(),
    () => const NoticiasDestination(),
    () => const ArquivosDestination(),
    () => const NotificacoesDestination(),
  ];

  bool sideBarExtended = true;

  @override
  void initState() {
    super.initState();
  }

  Widget _buildSidebar() {
    return NavigationRail(
      backgroundColor: Color(0xFFe8f3ed),

      // backgroundColor: ThemeConfig.kBgColor,
      extended: sideBarExtended,
      minExtendedWidth: 250,
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.people_outline),
          selectedIcon: Icon(Icons.people),
          label: Text(
            "Usuários",
            style: TextStyle(fontSize: 14),
          ),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.feed_outlined),
          selectedIcon: Icon(Icons.feed),
          label: Text(
            "Noticias",
            style: TextStyle(fontSize: 14),
          ),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.picture_as_pdf_outlined),
          selectedIcon: Icon(Icons.picture_as_pdf),
          label: Text(
            "Arquivos",
            style: TextStyle(fontSize: 14),
          ),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.notifications_outlined),
          selectedIcon: Icon(Icons.notifications),
          label: Text(
            "Notificações",
            style: TextStyle(fontSize: 14),
          ),
        ),
        // NavigationRailDestination(
        //   icon: Icon(Icons.settings_outlined),
        //   selectedIcon: Icon(Icons.settings),
        //   label: Text(
        //     "Configurações",
        //     style: TextStyle(fontSize: 14),
        //   ),
        // ),
      ],
      selectedIndex: currentDestinationIndex,
      onDestinationSelected: (int page) {
        setState(() {
          currentDestinationIndex = page;
        });
      },
    );
  }

  Widget _body() {
    return destinations[currentDestinationIndex]!.call();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, dimens) {
        return Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
          backgroundColor: Color(0xFFe8f3ed),
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SingleChildScrollView(
                child: SizedBox(
                  height: dimens.maxHeight,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Icon(Icons.eco_outlined,
                          size: 60, color: Colors.green),
                      const Text(
                        "SERPRO ABC+",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      // Image.asset("assets/logo.png", height: 180),
                      const SizedBox(height: 20),
                      IntrinsicHeight(
                        child: _buildSidebar(),
                      ),
                      const SizedBox(height: 10),
                      // ElevatedButton.icon(
                      //   icon: const Icon(Icons.exit_to_app),
                      //   onPressed: () {
                      //     // FirebaseAuth.instance.signOut();
                      //     // Navigator.pushAndRemoveUntil(
                      //     //   context,
                      //     //   MaterialPageRoute(
                      //     //     builder: (_) => const LoginScreen(),
                      //     //   ),
                      //     //   ((route) => false),
                      //     // );
                      //   },
                      //   label: const Text("Sair"),
                      // ),
                      const Expanded(child: SizedBox()),
                      TextButton(onPressed: () {}, child: Text("SAIR"))
                      // IconButton(
                      //   onPressed: () {
                      //     setState(() {
                      //       sideBarExtended = !sideBarExtended;
                      //     });
                      //   },
                      //   icon: Icon(
                      //     sideBarExtended
                      //         ? Icons.arrow_back_ios_new
                      //         : Icons.arrow_forward_ios,
                      //     color: Colors.black26,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              VerticalDivider(
                color:
                    Theme.of(context).colorScheme.onBackground.withOpacity(.2),
                width: 1,
              ),
              Expanded(
                child: _body(),
              )
            ],
          ),
        );
      },
    );
  }
}
