import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location Screen"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Text("Location Screen Content"),
      ),
    );
  }
}
