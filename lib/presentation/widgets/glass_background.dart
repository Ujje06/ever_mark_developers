import 'package:flutter/material.dart';

class GlassBackground extends StatefulWidget {
  final Widget child;

  const GlassBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<GlassBackground> createState() =>
      _GlassBackgroundState();
}

class _GlassBackgroundState
    extends State<GlassBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,

      builder: (context, child) {
        double value = controller.value;

        return Stack(
          children: [

            /// Main Gradient
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff050505),
                    Color(0xff0F172A),
                    Color(0xff111827),
                    Color(0xff1E1B4B),
                  ],
                ),
              ),
            ),

            /// Top Orb
            Positioned(
              top: -80 + (value * 25),
              right: -60 - (value * 20),
              child: Container(
                height: 220,
                width: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xff7C83FD)
                      .withValues(alpha: 0.18),
                ),
              ),
            ),

            /// Bottom Orb
            Positioned(
              bottom: -100 + (value * 18),
              left: -70 + (value * 20),
              child: Container(
                height: 260,
                width: 260,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xff64748B)
                      .withValues(alpha: 0.14),
                ),
              ),
            ),

            /// Center Pulse Glow
            Positioned(
              top: 180,
              left: 40,
              child: Opacity(
                opacity: 0.03 + (value * 0.04),
                child: Container(
                  height: 140,
                  width: 140,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            widget.child,
          ],
        );
      },
    );
  }
}
















// import 'package:flutter/material.dart';
//
// class GlassBackground extends StatelessWidget {
//   final Widget child;
//
//   const GlassBackground({
//     super.key,
//     required this.child,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//
//         /// Main Gradient Background
//         Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [
//                 Color(0xff050505),
//                 Color(0xff0F172A),
//                 Color(0xff111827),
//                 Color(0xff1E1B4B),
//               ],
//             ),
//           ),
//         ),
//
//         /// Top Right Glow
//         Positioned(
//           top: -80,
//           right: -60,
//           child: Container(
//             height: 220,
//             width: 220,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: const Color(0xff7C83FD)
//                   .withValues(alpha: 0.18),
//             ),
//           ),
//         ),
//
//         /// Bottom Left Glow
//         Positioned(
//           bottom: -100,
//           left: -70,
//           child: Container(
//             height: 260,
//             width: 260,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: const Color(0xff64748B)
//                   .withValues(alpha: 0.14),
//             ),
//           ),
//         ),
//
//         /// Center faint glow
//         Positioned(
//           top: 180,
//           left: 40,
//           child: Container(
//             height: 140,
//             width: 140,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.white
//                   .withValues(alpha: 0.03),
//             ),
//           ),
//         ),
//
//         /// Page Content
//         child,
//       ],
//     );
//   }
// }