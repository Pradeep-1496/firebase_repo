import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:foods24_firebase/firebase_options.dart';

import './Pages/Splash.dart';
// import './Pages/Booking.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

// void main() {
//   runApp(const MyApp());

//   // runApp(DevicePreview(builder: (context) => MyApp()));
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.system,
      // theme: ThemeData(
      //     scaffoldBackgroundColor: Colors.white, primaryColor: Colors.orange),
      home: SplashScreen(),
    );
  }
}
