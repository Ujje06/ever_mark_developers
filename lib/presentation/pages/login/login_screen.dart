import 'package:ever_mark_developers/presentation/widgets/logo_widget.dart';
import 'package:flutter/material.dart';
import '../../../core/navigation/app_navigator.dart';
import '../../../custom_elements/custom_images.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/glass_background.dart';
import '../../widgets/glass_card.dart';
import '../home/home_screen.dart';





class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  bool isLoading = false;


  void loginUser() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields")),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });


    AppNavigator.goTo(context, const HomeScreen());

    // try {
    //   final user = await di.loginUserUseCase.call(
    //     email: email,
    //     password: password,
    //   );
    //
    //   // ALWAYS check if mounted before setState after an await
    //   if (!mounted) return;
    //
    //   setState(() {
    //     isLoading = false;
    //   });
    //
    //   if (user != null) {
    //     AppNavigator.goTo(context, const HomeScreen());
    //   } else {
    //     // ❌ Failure logic
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       const SnackBar(
    //         content: Text("Invalid email or password"),
    //         backgroundColor: Colors.redAccent,
    //       ),
    //     );
    //   }
    // } catch (e) {
    //   // Handle errors like database being locked or missing
    //   if (mounted) {
    //     setState(() {
    //       isLoading = false;
    //     });
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text("An error occurred: $e")),
    //     );
    //   }
    //   debugPrint("Login Error: $e");
    // }


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff050505),
      resizeToAvoidBottomInset: true,


      body: GlassBackground(
        child: SafeArea(child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(20),

            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight,),
              child: Center(
                child: GlassCard(
                  width: 360, child: Column(mainAxisSize: MainAxisSize.min,

                  children: [

                    CustomImageWidget.circle(
                      path:
                      "assets/images/circular-border-logobrand.png",
                      size: 90,
                      borderColor:
                      Colors.white.withValues(alpha: 0.12),
                      borderThickness: 1.2,
                    ),

                    const SizedBox(height: 18),

                    const Text(
                      "Welcome Back",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "Secure login to continue",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 28),

                    CustomTextField(
                      controller: emailController,
                      hintText: "Enter Email",
                      prefixIcon: Icons.email_outlined,
                      keyboardType:
                      TextInputType.emailAddress,
                    ),

                    CustomTextField(
                      controller: passwordController,
                      hintText: "Enter Password",
                      prefixIcon: Icons.lock_outline,
                      isPassword: true,
                    ),

                    const SizedBox(height: 8),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Colors.white
                              .withValues(alpha: 0.75),
                          fontSize: 13,
                        ),
                      ),
                    ),

                    const SizedBox(height: 22),

                    CustomButton(
                      text: "Access Portal",
                      icon: Icons.arrow_forward,
                      isGlass: true,
                      isLoading: isLoading,
                      // onTap: loginUser,
                      onTap: () {
                        AppNavigator.goTo(context, const HomeScreen());
                      },
                    ),
                  ],

                ),


                ),
              ),

            ),
          );
        }


        ),
        ),
      ),
    );


    // body: GlassBackground(
    //   child:SafeArea(
    //   child: SingleChildScrollView(
    //     padding: const EdgeInsets.all(20),
    //
    //     child: SizedBox(
    //       height: MediaQuery.of(context).size.height - 40,
    //
    //       child: Center(
    //         child: GlassCard(
    //           width: 360,
    //
    //           child: Column(
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //
    //               CustomImageWidget.circle(
    //                 path:
    //                 "assets/images/circular-border-logobrand.png",
    //                 size: 90,
    //                 borderColor:
    //                 Colors.white.withValues(alpha: 0.12),
    //                 borderThickness: 1.2,
    //               ),
    //
    //               const SizedBox(height: 18),
    //
    //               const Text(
    //                 "Welcome Back",
    //                 style: TextStyle(
    //                   color: Colors.white,
    //                   fontSize: 26,
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //               ),
    //
    //               const SizedBox(height: 8),
    //
    //               const Text(
    //                 "Secure login to continue",
    //                 style: TextStyle(
    //                   color: Colors.white70,
    //                   fontSize: 14,
    //                 ),
    //               ),
    //
    //               const SizedBox(height: 28),
    //
    //               CustomTextField(
    //                 controller: emailController,
    //                 hintText: "Enter Email",
    //                 prefixIcon: Icons.email_outlined,
    //                 keyboardType:
    //                 TextInputType.emailAddress,
    //               ),
    //
    //               CustomTextField(
    //                 controller: passwordController,
    //                 hintText: "Enter Password",
    //                 prefixIcon: Icons.lock_outline,
    //                 isPassword: true,
    //               ),
    //
    //               const SizedBox(height: 8),
    //
    //               Align(
    //                 alignment: Alignment.centerRight,
    //                 child: Text(
    //                   "Forgot Password?",
    //                   style: TextStyle(
    //                     color: Colors.white
    //                         .withValues(alpha: 0.75),
    //                     fontSize: 13,
    //                   ),
    //                 ),
    //               ),
    //
    //               const SizedBox(height: 22),
    //
    //               CustomButton(
    //                 text: "Access Portal",
    //                 icon: Icons.arrow_forward,
    //                 isGlass: true,
    //                 isLoading: isLoading,
    //                 // onTap: loginUser,
    //                 onTap: () {AppNavigator.goTo(context, const HomeScreen());},
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),


//         ),
//       ),
//
//       ),
//
//
//
//
//
//
//     );
//   }
//
//
//
//
//
//
//
//
  }


}