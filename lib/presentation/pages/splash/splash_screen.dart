import 'package:flutter/material.dart';
import '../../../core/navigation/app_navigator.dart';
import '../../../custom_elements/animated_logo_widget.dart';
import '../../../custom_elements/custom_images.dart';
import '../login/login_screen.dart';
import 'animated_brand_text.dart';
import 'bottom_brand_caption.dart';
import 'dust_particle_background.dart';
import 'gradient_handler.dart';
import 'logo_pulse_glow.dart';






class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 4),
          () {
        if (mounted) {
          AppNavigator.goTo(
            context,
            const LoginScreen(),
          );
        }
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return AnimatedGradientWrapper(
      child: Scaffold(
        backgroundColor: Colors.transparent,


        body: Stack(
          children: [

            const DustParticleBackground(),

            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                // children: [
                //   const LogoPulseGlow(),
                //   const AnimatedLogoWidget(),
                //   const SizedBox(height: 24),
                //   const AnimatedBrandText(),
                // ],

                ////// glow behind the logo -->>

                children: [

                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const LogoPulseGlow(),
                      const AnimatedLogoWidget(),
                    ],
                  ),

                  const SizedBox(height: 24),

                  const AnimatedBrandText(),

                ],


              ),
            ),

            const Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Center(
                child: BottomBrandCaption(),
              ),
            ),
          ],
        ),




      ),
    );
  }
}





