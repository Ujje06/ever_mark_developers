import 'package:flutter/material.dart';

class AnimatedLogoWidget extends StatefulWidget {
  const AnimatedLogoWidget({super.key});

  @override
  State<AnimatedLogoWidget> createState() => _AnimatedLogoWidgetState();
}

class _AnimatedLogoWidgetState extends State<AnimatedLogoWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> scaleAnimation;
  late Animation<double> opacityAnimation;
  late Animation<double> shineAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    scaleAnimation = Tween<double>(
      begin: 1.6,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOutBack,
      ),
    );

    opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.5),
      ),
    );

    shineAnimation = Tween<double>(
      begin: -180,
      end: 180,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.4, 1.0),
      ),
    );

    controller.forward();
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
        return Opacity(
          opacity: opacityAnimation.value,
          child: Transform.scale(
            scale: scaleAnimation.value,
            child: SizedBox(
              height: 140,
              width: 140,

              child: ClipOval(
                child: Stack(
                  fit: StackFit.expand,
                  children: [

                    /// Circular logo image
                    Image.asset(
                      "assets/images/circular-border-logobrand.png",
                      fit: BoxFit.cover,
                    ),

                    /// Shine only while active
                    if (controller.value < 0.95)
                      Positioned(
                        left: shineAnimation.value,
                        top: -30,
                        child: Transform.rotate(
                          angle: -0.7,
                          child: Container(
                            height: 220,
                            width: 28,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.white.withValues(alpha: 0.08),
                                  Colors.white.withValues(alpha: 0.40),
                                  Colors.white.withValues(alpha: 0.08),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }





}