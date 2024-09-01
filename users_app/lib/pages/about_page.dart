import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // White background for the AppBar
        title: const Text(
          "Developed by",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
        ),
        elevation: 0, // Removes the AppBar shadow
      ),
      backgroundColor: Colors.white, // Set background color to white
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/logo2.png",
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "This app is developed by Group 8 of the commercial computing module.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black, // Dark black for larger font
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "In case of any misuse or any report, please contact admin at csanduwara1234@gmail.com",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54, // Lighter black for smaller font
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
