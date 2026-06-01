// // import 'package:ever_mark_developers/presentation/pages/splash/splash_screen.dart';
// // import 'package:ever_mark_developers/presentation/themes/app_theme.dart';
// // import 'package:flutter/material.dart';
// //
// //
// //
// // class App extends StatefulWidget {
// //   const App({super.key});
// //
// //   @override
// //   State<App> createState() => _AppState();
// // }
// //
// // class _AppState extends State<App> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'EverMark Developers', // 🔹 Updated title to match your brand
// //       debugShowCheckedModeBanner: false,
// //       theme: AppTheme.lightTheme,
// //
// //
// //       // Starting with the Splash Screen
// //       home: const SplashScreen(),
// //     );
// //   }
// // }
//
//
//
//
//
//
//
//
//
// import 'package:ever_mark_developers/presentation/pages/home/employee_list_screen.dart';
// import 'package:ever_mark_developers/presentation/pages/splash/splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import 'core/theme/app_theme.dart';
// import 'core/theme/theme_provider.dart';
//
// import 'database_api/providers/employee_provider.dart';
//
// import 'presentation/pages/home/home_screen.dart';
//
// class MyApp extends StatelessWidget {
//
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return MultiProvider(
//
//       providers: [
//
//         ChangeNotifierProvider(
//           create: (_) => EmployeeProvider(),
//         ),
//         // ✅ ADD THIS LINE HERE:
//         // ChangeNotifierProvider(create: (_) => BottomNavController()),
//
//
//       ],
//
//       child:
//       MaterialApp(
//
//         title: 'EverMark Developers',
//
//         debugShowCheckedModeBanner: false,
//
//         theme: AppTheme.lightTheme,
//         darkTheme: AppTheme.darkTheme,
//
//         themeMode: ThemeProvider.ThemeMode,
//
//         // home: const HomeScreen(),
//         home: const SplashScreen(),
//         // home: const EmployeeListScreen(),
//       ),
//     );
//   }
// }
//
//
//
//
//





import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/app_theme.dart';
import 'core/theme/theme_provider.dart';
import 'database_api/providers/employee_provider.dart';
import 'presentation/pages/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Manages database logic and employee states
        ChangeNotifierProvider(
          create: (_) => EmployeeProvider(),
        ),
        // Manages real-time light/dark mode switching
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'EverMark Developers',
            debugShowCheckedModeBanner: false,

            // Theme configurations
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.themeMode,

            // Entry point: Pure visual animations and branding
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}