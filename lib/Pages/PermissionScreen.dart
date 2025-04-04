import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'Home.dart';

class PermissionScreen extends StatelessWidget {
  // Function to request location permission
  Future<void> requestLocationPermission(BuildContext context) async {
    PermissionStatus status = await Permission.location.request();

    // If permission is granted, navigate to HomeScreen with cleared stack
    if (status.isGranted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false, // Removes all routes from the stack
      );
    } else if (status.isDenied || status.isPermanentlyDenied) {
      // You can also show a message explaining why permission is needed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Location permission is required to proceed.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom:
                MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 120),
              Image.asset('assets/img/permission.png', width: 200, height: 200),
              Text(
                "Grant Permission",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 60),

              // Location Permission Section
              permissionItem(
                icon: Icons.location_on,
                title: "Location Permission",
                subtitle: "To suggest the best restaurants near you",
              ),

              SizedBox(height: 20),

              // Notification Permission Section
              permissionItem(
                icon: Icons.notifications,
                title: "Notification Permission",
                subtitle: "To inform you about your booking",
              ),

              SizedBox(height: 100), // Adjust space dynamically

              // Proceed Button
              Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.orange, Colors.deepOrange],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    // Request location permission when the button is pressed
                    requestLocationPermission(context);
                  },
                  child: Text(
                    'Proceed',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget permissionItem(
      {required IconData icon,
      required String title,
      required String subtitle}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16), // Added padding
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.blue, size: 50),
          SizedBox(width: 16),
          Expanded(
            // Prevents overflow by wrapping text properly
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis, // Prevents overflow
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                  maxLines: 2, // Limits to 2 lines
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
