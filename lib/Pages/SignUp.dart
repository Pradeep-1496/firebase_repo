import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foods24_firebase/services/auth_service.dart';
import 'Login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'PermissionScreen.dart'; // Import the PermissionScreen page

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController(); // Confirm password controller
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLoading = false;
  bool _isPasswordVisible = false; // Flag to toggle password visibility
  bool _isConfirmPasswordVisible =
      false; // Flag to toggle confirm password visibility

  // Email & Password Signup
  Future<void> _registerWithEmail() async {
    setState(() => _isLoading = true);

    // Validate if passwords match
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Passwords do not match!")),
      );
      setState(() => _isLoading = false);
      return;
    }

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      User? user = userCredential.user;

      await user?.reload();
      user = _auth.currentUser; // Refresh user data

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Signup Successful: ${user?.email}")),
      );

      // Navigate to PermissionScreen after successful signup
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PermissionScreen()),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.message}")),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  // Google Sign-In
  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User? user = userCredential.user;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Google Sign-In Successful: ${user?.email}")),
      );

      // Navigate to PermissionScreen after successful signup
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PermissionScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Google Sign-In Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Fetch the current theme mode
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Image.asset('assets/logo2.png', width: 200, height: 200),

                const SizedBox(height: 20),

                // Create Account & Login Tabs
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(width: 100),
                    GestureDetector(
                      onTap: () {
                        // Handle Login text tap here
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ),
                        );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          color: theme.brightness == Brightness.dark
                              ? Colors.orange[100]
                              : Colors.orange[200],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // Email Field
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Email address",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: theme.brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: theme.brightness == Brightness.dark
                            ? Colors.white70
                            : Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: theme.brightness == Brightness.dark
                              ? Colors.white30
                              : Colors.grey,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: theme.brightness == Brightness.dark
                              ? Colors.orangeAccent
                              : Colors.orange,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Password Field
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: theme.brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  child: TextField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: theme.brightness == Brightness.dark
                              ? Colors.white70
                              : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: theme.brightness == Brightness.dark
                              ? Colors.white30
                              : Colors.grey,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: theme.brightness == Brightness.dark
                              ? Colors.orangeAccent
                              : Colors.orange,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Confirm Password Field
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Confirm Password",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: theme.brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  child: TextField(
                    controller: _confirmPasswordController,
                    obscureText: !_isConfirmPasswordVisible,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isConfirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: theme.brightness == Brightness.dark
                              ? Colors.white70
                              : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _isConfirmPasswordVisible =
                                !_isConfirmPasswordVisible;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: theme.brightness == Brightness.dark
                              ? Colors.white30
                              : Colors.grey,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: theme.brightness == Brightness.dark
                              ? Colors.orangeAccent
                              : Colors.orange,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Registration Button
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
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: _isLoading ? null : _registerWithEmail,
                    child: _isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                            'Registration',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),

                SizedBox(height: 20),

                // Google Sign Up Button
                Container(
                  width: 350,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
                      shadowColor: const Color.fromARGB(90, 0, 0, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: _signInWithGoogle,
                    child: Center(
                      child: Row(
                        children: [
                          Image.asset('assets/img/Google.png',
                              width: 35, height: 35),
                          const SizedBox(width: 50),
                          Text(
                            'Sign up with Google',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: theme.brightness == Brightness.dark
                                  ? Colors.black
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
