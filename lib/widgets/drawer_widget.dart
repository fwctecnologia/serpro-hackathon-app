import 'package:abc_monitor/app/pages/perfil/perfil_page.dart';
import 'package:abc_monitor/app/pages/propriedade/propriedade_page.dart';
import 'package:abc_monitor/theme.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class AppDrawerWidget extends StatelessWidget {
  const AppDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Image.asset(Constants.personCircleAsset),
          Container(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: AppTheme.kDarkGreen,
              height: 2,
              thickness: 1.2,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: AppTheme.kDarkGreen,
            ),
            title: Text(
              'Perfil',
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 16),
            ),
            onTap: () {
              Navigator.of(context).pop();

              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PerfilPage(),
              ));
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: AppTheme.kDarkGreen,
              height: 2,
              thickness: 1.2,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.business,
              color: AppTheme.kDarkGreen,
            ),
            title: Text(
              'Propriedades',
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 16),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PropriedadePage(),
              ));
            },
          ),
          Container(
            height: MediaQuery.sizeOf(context).height * 0.08,
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              "Entre em contato",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 13,
                    decoration: TextDecoration.underline,
                  ),
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () async {},
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text("Sair",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 13,
                      decoration: TextDecoration.underline,
                    )),
          ),
        ],
      ),
    );
  }
}
