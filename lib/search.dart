import 'package:flutter/material.dart';
import 'application.dart';
import 'profile.dart';
import 'qr_reader.dart';
import 'progress.dart';
class JobSearchScreen extends StatelessWidget {
  const JobSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E3748),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        toolbarHeight: 90, // Adjusted appbar height
        titleSpacing: 0, // Remove extra spacing
        title: Padding(
          padding: const EdgeInsets.only(left: 20), // Padding for logo
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo Section without background color and no clipping
              SizedBox(
                width: 55, // Adjusted size for consistency
                height: 55,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain, // Ensures the logo is not cropped
                ),
              ),
              // Profile Picture Section without background color and clipping
              Padding(
                padding: const EdgeInsets.only(right: 20), // Padding for profile pic
                child: SizedBox(
                  width: 55,
                  height: 55,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/profile.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          _buildSearchHeader(), // Search Bar
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20), // Added top padding for JobCards
              child: _buildJobCards(), // Job Cards
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(context), // Bottom Navigation
    );
  }

  Widget _buildSearchHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF0CCDDF),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFF2E3748),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        height: 50, 
        margin: const EdgeInsets.only(top: 55),
        child: const TextField(
          textAlignVertical: TextAlignVertical.center, 
          textAlign: TextAlign.center, 
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 15), // Adjust the padding for icon space
              child: Icon(
                Icons.search,
                color: Colors.black,
                size: 28, // Increased the size of the search icon
              ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20), // Padding to make the icon and text align properly
            isDense: true,  // Make the TextField less tall
          ),
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildJobCards() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: const [
        _JobCard(title: "Web Developer", company: "Abc Company", location: "New Visayas"),
        _JobCard(title: "Office Assistant", company: "ForYou Company", location: "Gredu"),
        _JobCard(title: "Sales Assistant", company: "Iwi Company", location: "Little Panay"),
      ],
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    decoration: const BoxDecoration(
      color: Color(0xFF0F172A),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildIconButton(
          icon: Icons.bookmark_border,
          onPressed: () {
            // Navigate to a desired screen for the bookmark icon
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => JobProgressScreen()), // Replace with the correct screen/widget for your bookmark action
            );
          },
        ),
        _buildIconButton(
          icon: Icons.qr_code_scanner,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QRReaderScreen()), // Replace with the correct class name for your QR reader screen
            );
          },
        ),
        _buildIconButton(
          icon: Icons.person_outline,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()), // Replace with your ProfileScreen widget
            );
          },
        ),
      ],
    ),

  );
}

IconButton _buildIconButton({
  required IconData icon,
  required VoidCallback onPressed,
}) {
  return IconButton(
    icon: Icon(icon, color: Colors.white, size: 30),
    onPressed: onPressed,
  );
}

}

class _JobCard extends StatelessWidget {
  final String title;
  final String company;
  final String location; // Added location parameter

  const _JobCard({
    required this.title,
    required this.company,
    required this.location, // Initialize location
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.bookmark_border,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    company,
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    location,  // Added location text
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to Application screen when "Apply" button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ApplicationScreen()), // Replace with your actual ApplicationScreen widget
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF00FFA3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Apply",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
