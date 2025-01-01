import 'package:flutter/material.dart';

import '../assets/icon_assets.dart';

class MenuIcon extends StatelessWidget {
  const MenuIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(
        IconAssets.ic_menu,
        width: 63,
        height: 63,
      ),
      onPressed: () => Scaffold.of(context).openDrawer(),
    );
  }
}
