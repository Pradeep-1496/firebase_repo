import 'package:flutter/material.dart';
import 'Login.dart';
import 'SignUp.dart';

void main() {
  runApp(First());
}

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.orange,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.orange,
          elevation: 0,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
              color: Colors.black), // Replaced bodyText1 with bodyLarge
          bodyMedium: TextStyle(
              color: Colors.black54), // Replaced bodyText2 with bodyMedium
          titleLarge: TextStyle(
            // Replaced headline6 with titleLarge
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors
                .orange, // Corrected: use backgroundColor instead of primary
            foregroundColor: Colors
                .white, // Corrected: use foregroundColor instead of onPrimary
            minimumSize: Size(250, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.deepOrange,
        scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepOrange,
          elevation: 0,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
              color: Colors.white), // Replaced bodyText1 with bodyLarge
          bodyMedium: TextStyle(
              color: Colors.white70), // Replaced bodyText2 with bodyMedium
          titleLarge: TextStyle(
            // Replaced headline6 with titleLarge
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.deepOrange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors
                .deepOrange, // Corrected: use backgroundColor instead of primary
            foregroundColor: Colors
                .white, // Corrected: use foregroundColor instead of onPrimary
            minimumSize: Size(250, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      themeMode: ThemeMode.system, // Automatically follow system theme
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 100.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 90),
                    Image.asset('assets/logo.png', width: 200, height: 200),
                    const SizedBox(height: 20),
                    Text(
                      'Welcome',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge, // Using dynamic theme
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Before Enjoying Foodmedia Services\nPlease Register First',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium, // Using dynamic theme
                    ),
                  ],
                ),
              ),
              Container(
                width: 250,
                height: 56,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.orange, Colors.deepOrange],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegistrationScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // Background color
                    foregroundColor: Colors.white, // Text color
                    minimumSize: Size(250, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Text color
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade100,
                  foregroundColor: Colors.deepOrange,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  minimumSize: Size(250, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 80),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'By Logging In Or Registering, You Have Agreed To The ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium, // Using dynamic theme
                    ),
                    TextSpan(
                      text: 'Terms And Conditions ',
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    TextSpan(
                      text: 'And ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium, // Using dynamic theme
                    ),
                    TextSpan(
                      text: 'Privacy Policy.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
