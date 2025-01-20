import 'package:flutter/material.dart';

import '../colors/app_color.dart';

class RoundButtonBorder extends StatelessWidget {
  const RoundButtonBorder(
      {Key? key,
      this.buttonColor = AppColor.whiteColor,
      this.borderColor = AppColor.colorPrimary,
      this.textColor = AppColor.colorPrimary,
      this.progressColor = AppColor.colorPrimary,
      required this.title,
      required this.onPress,
      this.width = double.infinity,
      this.height = 64,
      this.fontSize = 20,
      this.fontWeight = FontWeight.w400,
      this.radius = 8,
      this.borderWidth = 1,
      this.loading = false})
      : super(key: key);

  final bool loading;
  final String title;
  final double borderWidth;
  final double height, width, fontSize, radius;
  final FontWeight fontWeight;
  final VoidCallback onPress;

  final Color textColor, buttonColor, borderColor, progressColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          border: Border.all(
            color: borderColor, // Set your desired border color here
            width: borderWidth, // Adjust the width of the border as needed
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: loading
            ? Center(
                child: CircularProgressIndicator(
                color: progressColor,
              ))
            : Center(
                child: Text(
                  title,
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: fontWeight,
                      fontSize: fontSize,
                      color: textColor),
                ),
              ),
      ),
    );
  }
}
