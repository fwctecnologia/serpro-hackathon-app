import 'dart:io';

import 'package:flutter/material.dart';

import '../theme.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height;
  const AppBarWidget({Key? key, required this.title, this.height = 50})
      : super(key: key);

  IconData get getIcon =>
      Platform.isIOS ? Icons.arrow_back_ios_new : Icons.arrow_back;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(getIcon, color: AppTheme.kBlack),
      ),
      title: Text(
        title,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
