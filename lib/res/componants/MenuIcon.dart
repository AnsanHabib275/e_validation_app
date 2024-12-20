import 'package:flutter/material.dart';

import '../assets/icon_assets.dart';

class MenuIcon extends StatelessWidget {
  const MenuIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 23, // Adjust padding based on your layout
      left: 20,
      child: IconButton(
        icon: Image.asset(
          IconAssets.ic_menu, // Replace with your icon asset
          width: 24,
          height: 18,
        ),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
    );
  }
}
