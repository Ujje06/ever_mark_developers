import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;

  // --- Basic Style ---
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final String? fontFamily;
  final FontStyle? fontStyle;
  final double? letterSpacing;
  final double? wordSpacing;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final double? height;

  // --- Layout & Spacing ---
  final TextAlign? textAlign;
  final TextOverflow overflow;
  final int? maxLines;
  final bool softWrap;
  final double? pTop, pBottom, pLeft, pRight;
  final double? mTop, mBottom, mLeft, mRight;

  // --- Advanced Elements ---
  final List<Shadow>? shadows;
  final Paint? foreground;
  final Paint? background;
  final TextHeightBehavior? textHeightBehavior;
  final TextWidthBasis? textWidthBasis;
  final Locale? locale;
  final TextDirection? textDirection;
  final double? textScaleFactor;

  const CustomText(
      this.text, {
        super.key,
        this.fontSize,
        this.fontWeight,
        this.color,
        this.fontFamily,
        this.fontStyle,
        this.letterSpacing,
        this.wordSpacing,
        this.decoration,
        this.decorationColor,
        this.height,
        this.textAlign,
        this.overflow = TextOverflow.ellipsis,
        this.maxLines,
        this.softWrap = true,
        // Spacing
        this.pTop, this.pBottom, this.pLeft, this.pRight,
        this.mTop, this.mBottom, this.mLeft, this.mRight,
        // Advanced
        this.shadows,
        this.foreground,
        this.background,
        this.textHeightBehavior,
        this.textWidthBasis,
        this.locale,
        this.textDirection,
        this.textScaleFactor,
      });

  // ... Factory methods (headline, body, caption) go here ...


  // A helper to make text look consistent on different screen sizes
  double _getResponsiveSize(BuildContext context, double baseSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    // Standard mobile width is around 375. This scales the font slightly.
    return (baseSize * screenWidth) / 375;
  }




  factory CustomText.error(String text) {
    return CustomText(
      text,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.redAccent,
      mTop: 5,
      mBottom: 5,
    );
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: mTop ?? 0, bottom: mBottom ?? 0,
        left: mLeft ?? 0, right: mRight ?? 0,
      ),
      padding: EdgeInsets.only(
        top: pTop ?? 0, bottom: pBottom ?? 0,
        left: pLeft ?? 0, right: pRight ?? 0,
      ),
      child: Text(
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        softWrap: softWrap,
        textScaleFactor: textScaleFactor,
        textDirection: textDirection,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
        locale: locale,
        style: TextStyle(
          fontSize: fontSize != null ? _getResponsiveSize(context, fontSize!) : null,
          fontWeight: fontWeight,
          color: foreground == null ? color : null, // Color must be null if foreground is used
          fontFamily: fontFamily,
          fontStyle: fontStyle,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
          decoration: decoration,
          decorationColor: decorationColor,
          height: height,
          shadows: shadows,
          foreground: foreground,
          background: background,
        ),
      ),
    );
  }
}