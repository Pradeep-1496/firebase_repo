import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:foods24_firebase/firebase_options.dart';

import './Pages/Splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp()); // No need for 'const' here
}

class MyApp extends StatelessWidget {
  MyApp({super.key}); // Remove 'const' from the constructor

  // Define the Light and Dark themes
  final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.orange, // Change as per your design
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(backgroundColor: Colors.orange),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.black), // Updated to 'bodyLarge'
      bodyMedium: TextStyle(color: Colors.black), // Updated to 'bodyMedium'
      bodySmall: TextStyle(color: Colors.black), // Updated to 'bodySmall'
    ),
    buttonTheme: ButtonThemeData(
        buttonColor: Colors.orange), // Example for button styling
    colorScheme: ColorScheme.light(
      primary: Colors.orange, // Primary color
      secondary: Colors.orangeAccent, // Secondary color
      onPrimary: Colors.white, // Text color on primary
      onSecondary:
          const Color.fromARGB(255, 34, 12, 41), // Text color on secondary
    ),
  );

  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.deepOrange, // Dark theme primary color
    scaffoldBackgroundColor: const Color.fromARGB(255, 34, 12, 41),
    appBarTheme: AppBarTheme(backgroundColor: Colors.black),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.white), // Updated to 'bodyLarge'
      bodyMedium: TextStyle(color: Colors.white), // Updated to 'bodyMedium'
      bodySmall: TextStyle(color: Colors.white), // Updated to 'bodySmall'
    ),
    buttonTheme: ButtonThemeData(buttonColor: Colors.deepOrange),
    colorScheme: ColorScheme.dark(
      primary: Colors.deepOrange, // Primary color
      secondary: Colors.deepOrangeAccent, // Secondary color
      onPrimary: const Color.fromARGB(255, 34, 12, 41), // Text color on primary
      onSecondary: Colors.white, // Text color on secondary
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme, // Apply light theme
      darkTheme: darkTheme, // Apply dark theme
      themeMode: ThemeMode.system, // Automatically follow system theme
      home: SplashScreen(),
    );
  }
}
