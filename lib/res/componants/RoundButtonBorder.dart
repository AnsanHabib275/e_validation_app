import 'package:flutter/material.dart';

import '../colors/app_color.dart';

class RoundButtonBorder extends StatelessWidget {
  const RoundButtonBorder(
      {Key? key,
      this.buttonColor = AppColor.whiteColor,
      this.borderColor = AppColor.colorPrimary,
      this.textColor = AppColor.colorPrimary,
      required this.title,
      required this.onPress,
      this.width = double.infinity,
      this.height = 64,
      this.borderWidth = 1,
      this.loading = false})
      : super(key: key);

  final bool loading;
  final String title;
  final double borderWidth;
  final double height, width;
  final VoidCallback onPress;

  final Color textColor, buttonColor, borderColor;

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
          borderRadius: BorderRadius.circular(8),
        ),
        child: loading
            ? Center(
                child: CircularProgressIndicator(
                color: AppColor.colorPrimary,
              ))
            : Center(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: textColor),
                ),
              ),
      ),
    );
  }
}
