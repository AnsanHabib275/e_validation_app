import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';
import '../assets/icon_assets.dart';

class MenuIcon extends StatelessWidget {
  const MenuIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        IconAssets.ic_menu,
        width: Get.width * Utils.getResponsiveWidth(63),
        height: Get.height * Utils.getResponsiveHeight(63),
      ),
      onPressed: () => Scaffold.of(context).openDrawer(),
    );
  }
}
