import 'dart:ui';
import 'package:flutter/material.dart';





class GlassCard extends StatelessWidget {
  final Widget child;

  final double? width;
  final double? height;

  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  final double borderRadius;
  final double blurX;
  final double blurY;

  final Color? backgroundColor;
  final Color? borderColor;

  const GlassCard({
    super.key,
    required this.child,

    this.width,
    this.height,

    this.padding,
    this.margin,

    this.borderRadius = 28,
    this.blurX = 18,
    this.blurY = 18,

    this.backgroundColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,

      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),

        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: blurX,
            sigmaY: blurY,
          ),

          child: Container(
            width: width,
            height: height,

            padding: padding ??
                const EdgeInsets.all(24),





            decoration: BoxDecoration(
              color: backgroundColor ??
                  Colors.white.withValues(alpha: 0.07),

              borderRadius:
              BorderRadius.circular(borderRadius),

              border: Border.all(
                color: borderColor ??
                    const Color(0xff7C83FD)
                        .withValues(alpha: 0.22),
                width: 1.15,
              ),

              boxShadow: [

                // depth shadow
                BoxShadow(
                  blurRadius: 24,
                  spreadRadius: 1,
                  offset: const Offset(0, 12),
                  color: Colors.black.withValues(alpha: 0.28),
                ),

                // premium glow
                BoxShadow(
                  blurRadius: 26,
                  spreadRadius: 0,
                  color: const Color(0xff7C83FD)
                      .withValues(alpha: 0.14),
                ),
              ],
            ),




            // decoration: BoxDecoration(
            //   color: backgroundColor ??
            //       Colors.white.withValues(alpha: 0.07),
            //
            //   borderRadius:
            //   BorderRadius.circular(borderRadius),
            //
            //   border: Border.all(
            //     color: borderColor ??
            //         Colors.white.withValues(alpha: 0.14),
            //     width: 1.1,
            //   ),
            //
            //   boxShadow: [
            //
            //     /// outer dark depth
            //     BoxShadow(
            //       blurRadius: 20,
            //       spreadRadius: 1,
            //       offset: const Offset(0, 10),
            //       color: Colors.black.withValues(alpha: 0.25),
            //     ),
            //
            //     /// premium glow
            //     BoxShadow(
            //       blurRadius: 22,
            //       spreadRadius: 0,
            //       color: Colors.deepPurple
            //           .withValues(alpha: 0.12),
            //     ),
            //   ],
            // ),




            child: child,
          ),
        ),
      ),
    );
  }
}