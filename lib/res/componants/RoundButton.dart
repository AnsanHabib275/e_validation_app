import 'package:flutter/material.dart';

import '../colors/app_color.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {Key? key,
      this.buttonColor = AppColor.colorPrimary,
      this.textColor = AppColor.textWhite,
      this.progressColor = AppColor.whiteColor,
      required this.title,
      required this.onPress,
      this.width = double.infinity,
      this.height = 64,
      this.fontSize = 20,
      this.fontWeight = FontWeight.w400,
      this.radius = 8,
      this.loading = false})
      : super(key: key);

  final bool loading;
  final String title;
  final double height, width, fontSize, radius;
  final FontWeight fontWeight;
  final VoidCallback onPress;

  final Color textColor, buttonColor, progressColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: loading
            ? Center(
                child: CircularProgressIndicator(
                color: AppColor.whiteColor,
              ))
            : Center(
                child: Text(
                  title,
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: fontWeight,
                      fontSize: fontSize,
                      color: textColor),
                  // style: Theme.of(context)
                  //     .textTheme
                  //     .titleMedium!
                  //     .copyWith(color: AppColor.whiteColor),
                ),
              ),
      ),
    );
  }
}
