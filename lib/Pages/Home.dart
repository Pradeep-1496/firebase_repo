import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:foods24_firebase/Pages/NewArrival.dart';
import './Booking.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.home, color: Colors.orange),
            SizedBox(width: 5),
            Text(
              "Home",
              style: textTheme.bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Icon(Icons.keyboard_arrow_down, color: Colors.orange),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.orange),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: theme.brightness == Brightness.dark
                      ? Colors.grey[800]
                      : Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search,
                        color: theme.brightness == Brightness.dark
                            ? Colors.grey[400]
                            : Colors.grey),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        style: textTheme.bodyMedium,
                        decoration: InputDecoration(
                          hintText: "Restaurant name",
                          hintStyle: textTheme.bodyMedium!.copyWith(
                            color: theme.brightness == Brightness.dark
                                ? Colors.grey[400]
                                : Colors.grey,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 48),

              // Image Carousel
              CarouselSlider(
                options: CarouselOptions(
                  height: 180,
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.85,
                ),
                items: [
                  restaurantCard(context, "Pavilion Restaurant", "50% off",
                      "assets/img/pavilion.jpg"),
                  restaurantCard(
                      context, "Level 5", "30% off", "assets/img/level5.jpg"),
                  restaurantCard(
                      context, "Kshitij", "20% off", "assets/img/kshitij.png"),
                ],
              ),

              SizedBox(height: 40),

              sectionTitle("Today New Arrivable", context),
              SizedBox(height: 10),

              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    restaurantTile(context, "Ganesh Aloopuri",
                        "ganesh aloopuri, surat", "assets/img/ganesh.jpeg"),
                    restaurantTile(context, "Level 5", "Level 5 cafe, surat",
                        "assets/img/level5.jpg"),
                    restaurantTile(context, "Chaat Hub", "Ambika Chaat, surat",
                        "assets/img/chaat.jpeg"),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Booking Restaurant",
                      style: textTheme.bodyLarge!
                          .copyWith(fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 10),

              // Booking Tiles
              bookingTile(context, "Kshitij Restaurant",
                  "assets/img/kshitij.png", "11:00 pm"),
              SizedBox(height: 20),
              bookingTile(
                  context, "Spice Villa", "assets/img/spice.jpeg", "11:00 pm"),
              SizedBox(height: 20),
              bookingTile(context, "Krishna Restaurant",
                  "assets/img/harikrishna.png", "11:00 pm"),
              SizedBox(height: 20),
              bookingTile(
                  context, "Level 5 Cafe", "assets/img/level5.jpg", "12:00 am"),
              SizedBox(height: 20),
              bookingTile(context, "Tandoor Hunt", "assets/img/tandoor.jpeg",
                  "11:45 pm"),
              SizedBox(height: 20),
              bookingTile(
                  context, "Om Restaurant", "assets/img/om.jpeg", "11:00 pm"),
              SizedBox(height: 20),
              bookingTile(
                  context, "Lapinozz", "assets/img/lapinoz.jpeg", "10:30 pm"),
              SizedBox(height: 20),
              bookingTile(context, "Baba Sai Dosa", "assets/img/level5.jpg",
                  "12:00 am"),
              SizedBox(height: 20),
              bookingTile(context, "365 Travel Cafe", "assets/img/365.jpeg",
                  "11:45 pm"),
              SizedBox(height: 20),
              bookingTile(
                  context, "Domino's", "assets/img/dominos.jpeg", "11:00 pm"),
              SizedBox(height: 20),
              bookingTile(
                  context, "K's Veranda", "assets/img/ks.jpeg", "10:30 pm"),
              SizedBox(height: 20),
              bookingTile(
                  context, "Jungle Book", "assets/img/jungle.jpeg", "11:45 pm"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSurface.withOpacity(0.6),
        backgroundColor: colorScheme.surface,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }

  Widget restaurantCard(
      BuildContext context, String name, String discount, String imagePath) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(imagePath,
              width: 350, height: 180, fit: BoxFit.cover),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              discount,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              shadows: [Shadow(color: Colors.black, blurRadius: 4)],
            ),
          ),
        ),
      ],
    );
  }

  Widget restaurantTile(
      BuildContext context, String name, String location, String imagePath) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: 130,
      margin: EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(imagePath,
                width: 130, height: 80, fit: BoxFit.cover),
          ),
          SizedBox(height: 5),
          Text(name,
              style:
                  textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)),
          Text(location,
              style: textTheme.bodySmall!.copyWith(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget bookingTile(
      BuildContext context, String name, String imagePath, String closingTime) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final brightness = theme.brightness;

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: brightness == Brightness.dark
            ? Colors.grey[850] // Dark mode background
            : Colors.grey[200], // Light mode background
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(imagePath,
                width: 80, height: 60, fit: BoxFit.cover),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis),
                SizedBox(height: 4),
                Text("Close: $closingTime",
                    style: textTheme.bodySmall!.copyWith(color: Colors.grey)),
              ],
            ),
          ),
          SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookingPage(
                    restaurantName: name,
                    imagePath: imagePath,
                    closingTime: closingTime,
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              minimumSize: Size(60, 35),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            child: Text("Book", style: TextStyle(color: colorScheme.onPrimary)),
          ),
        ],
      ),
    );
  }

  Widget sectionTitle(String title, BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewArrivalsPage()),
            );
          },
          child: Text("See All", style: TextStyle(color: Colors.orange)),
        ),
      ],
    );
  }
}
