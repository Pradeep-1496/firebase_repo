import 'package:flutter/material.dart';

class BookingRestaurantPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking Restaurants"),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          bookingTile("Krishna Restaurant", "Open", "Close: 11:00 pm",
              "assets/img/harikrishna.png"),
          bookingTile("Spice Villa", "Open", "Close: 10:30 pm",
              "assets/img/spice.jpeg"),
          bookingTile("Level 5 Cafe", "Open", "Close: 12:00 am",
              "assets/img/level5.jpg"),
          bookingTile("Tandoor Hunt", "Open", "Close: 11:45 pm",
              "assets/img/tandoor.jpeg"),
          bookingTile(
              "Om Restaurant", "Open", "Close: 11:00 pm", "assets/img/om.jpeg"),
          bookingTile(
              "Lapinozz", "Open", "Close: 10:30 pm", "assets/img/lapinoz.jpeg"),
          bookingTile("Baba Sai dhosa", "Open", "Close: 12:00 am",
              "assets/img/level5.jpg"),
          bookingTile("365 travel cafe", "Open", "Close: 11:45 pm",
              "assets/img/365.jpeg"),
          bookingTile("Domino's ", "Open", "Close: 11:00 pm",
              "assets/img/dominos.jpeg"),
          bookingTile(
              "K's vernda", "Open", "Close: 10:30 pm", "assets/img/ks.jpeg"),
          bookingTile("Jungle book", "Open", "Close: 11:45 pm",
              "assets/img/jungle.jpeg"),
        ],
      ),
    );
  }

  Widget bookingTile(
      String name, String status, String time, String imagePath) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8), // Rounded corners for image
          child: Image.asset(
            imagePath,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(status, style: TextStyle(color: Colors.green)),
            Text(time, style: TextStyle(color: Colors.grey)),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
          child: Text("Book", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
