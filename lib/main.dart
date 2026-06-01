// // import 'dart:io';
// //
// // import 'package:flutter/material.dart';
// // import 'app.dart'; // 🔹 Import your provider file
// //
// // import 'package:provider/provider.dart'; // 🔹 Import provider
// //
// //
// //
// //
// // // 🔹 Add this class to bypass SSL certificate checks for local development
// // class MyHttpOverrides extends HttpOverrides {
// //   @override
// //   HttpClient createHttpClient(SecurityContext? context) {
// //     return super.createHttpClient(context)
// //       ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
// //   }
// // }
// //
// //
// //
// //
// //
// //
// // void main() async{
// //   // 🔹 Tell the app to use the overrides before doing anything else
// //   HttpOverrides.global = MyHttpOverrides();
// //
// //
// //   WidgetsFlutterBinding.ensureInitialized();
// //   // Initialize services here (Firebase, DI, etc.)
// //
// // // If you are using your old SQLite database logic alongside the API,
// //   // initialize it here. Otherwise, we proceed to the API setup.
// //
// //
// //   runApp(
// //      const MyApp(),
// //
// //   );
// // }
// //
// //
// //
// //
// // class MyApp extends StatefulWidget {
// //   const MyApp({super.key});
// //
// //   @override
// //   State<MyApp> createState() => _MyAppState();
// // }
// //
// // class _MyAppState extends State<MyApp> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return const App();
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
// import 'dart:io';
//
// import 'package:flutter/material.dart';
//
// import 'app.dart';
//
// class MyHttpOverrides
//     extends HttpOverrides {
//
//   @override
//   HttpClient createHttpClient(
//       SecurityContext? context) {
//
//     return super.createHttpClient(context)
//
//       ..badCertificateCallback = (
//           X509Certificate cert,
//           String host,
//           int port,
//           ) => true;
//   }
// }
//
// void main() {
//
//   HttpOverrides.global =
//       MyHttpOverrides();
//
//   WidgetsFlutterBinding
//       .ensureInitialized();
//
//   runApp(
//     const MyApp(),
//   );
// }
//
//
//
//
//
//
//
//
//
//
//



import 'dart:io';
import 'package:ever_mark_developers/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'app.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (
          X509Certificate cert,
          String host,
          int port,
          ) => true;
  }
}

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();


  runApp(
    const MyApp(),
  );
}