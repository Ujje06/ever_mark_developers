import 'package:flutter/material.dart';





class UiHelper {


// single image

  static Widget customImage({
    required String img, double? height, double? width,
    // full pading and margin
    EdgeInsets? padding, EdgeInsets? margin,
    //padding
    double? paddingTop, double? paddingBottom, double? paddingLeft, double? paddingRight,
    // margin
    double? marginTop, double? marginBottom, double? marginLeft, double? marginRight,

  }) {
    return Container(
      padding: padding ??
          EdgeInsets.only(
            top: paddingTop ?? 0,
            bottom: paddingBottom ?? 0,
            left: paddingLeft ?? 0,
            right: paddingRight ?? 0,
          ),
      margin: margin ??
          EdgeInsets.only(
            top: marginTop ?? 0,
            bottom: marginBottom ?? 0,
            left: marginLeft ?? 0,
            right: marginRight ?? 0,
          ),
      child: Image.asset(
        "assets/images/$img",
        height: height,
        width: width,
      ),
    );
  }


  // container with two images
  static Widget twoImagesContainer(
      {required String img1, required String img2, double spacing = 10, MainAxisAlignment alignment = MainAxisAlignment
          .center,}) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          customImage(img: img1),
          SizedBox(height: spacing,),
          customImage(img: img2),
        ],
      ),
    );
  }


  static customText(
      {required String text, required Color color, required fontweight, String? fontfamily, required double fontsize}) {
    return Text(text, style: TextStyle(color: color,
        fontWeight: fontweight,
        fontFamily: fontfamily,
        fontSize: fontsize),);
  }


  // custom toast

  static void showSnackBar({
    required BuildContext context,
    required String message,
    Color backgroundColor = Colors.black,
    Duration duration = const Duration(seconds: 2),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: backgroundColor,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(12),
      ),
    );
  }


  // ================================
  // 🔥 SCREEN SWITCH METHOD
  // ================================
}




