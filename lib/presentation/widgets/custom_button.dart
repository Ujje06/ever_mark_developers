import 'package:flutter/material.dart';





class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback? onTap;

  final double? width;
  final double height;

  final IconData? icon;

  final bool isLoading;
  final bool enabled;
  final bool isGlass;

  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;

  final double borderRadius;
  final double fontSize;
  final FontWeight fontWeight;

  final Gradient? gradient;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,

    this.width,
    this.height = 56,

    this.icon,

    this.isLoading = false,
    this.enabled = true,
    this.isGlass = false,

    this.margin,
    this.padding,

    this.backgroundColor,
    this.textColor,
    this.borderColor,

    this.borderRadius = 18,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,

    this.gradient,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  double scaleValue = 1.0;

  void pressDown() {
    setState(() {
      scaleValue = 0.97;
    });
  }

  void pressUp() {
    setState(() {
      scaleValue = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool disabled = !widget.enabled || widget.isLoading;

    return Container(
      margin: widget.margin ??
          const EdgeInsets.symmetric(vertical: 8),

      child: AnimatedScale(
        scale: scaleValue,
        duration: const Duration(milliseconds: 120),

        child: GestureDetector(
          onTapDown: (_) {
            if (!disabled) pressDown();
          },
          onTapUp: (_) {
            if (!disabled) pressUp();
          },
          onTapCancel: () {
            if (!disabled) pressUp();
          },
          onTap: disabled ? null : widget.onTap,

          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            width: widget.width ?? double.infinity,
            height: widget.height,

            padding: widget.padding ??
                const EdgeInsets.symmetric(horizontal: 16),

            decoration: BoxDecoration(
              gradient: widget.gradient,

              color: widget.gradient == null
                  ? widget.isGlass
                  ? Colors.white.withValues(alpha: 0.07)
                  : widget.backgroundColor ??
                  Colors.deepPurple
                  : null,

              borderRadius:
              BorderRadius.circular(widget.borderRadius),

              border: Border.all(
                color: widget.borderColor ??
                    Colors.white.withValues(alpha: 0.12),
              ),

              boxShadow: [
                BoxShadow(
                  blurRadius: 18,
                  spreadRadius: 1,
                  offset: const Offset(0, 8),
                  color: Colors.black.withValues(alpha: 0.25),
                ),
              ],
            ),

            child: Center(
              child: widget.isLoading
                  ? const SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2.4,
                  color: Colors.white,
                ),
              )
                  : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.icon != null) ...[
                    Icon(
                      widget.icon,
                      size: 20,
                      color:
                      widget.textColor ?? Colors.white,
                    ),
                    const SizedBox(width: 10),
                  ],

                  Text(
                    widget.text,
                    style: TextStyle(
                      color: disabled
                          ? Colors.white54
                          : widget.textColor ??
                          Colors.white,
                      fontSize: widget.fontSize,
                      fontWeight: widget.fontWeight,
                      letterSpacing: 0.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}