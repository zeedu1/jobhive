import 'package:flutter/material.dart';
import 'search.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JobSeekerProfileScreen(),
    );
  }
}

class JobSeekerProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Background color for the top section
      body: Stack(
        children: [
          // Back Button Positioned at the Top
          Positioned(
              top: 60, // Adjust the position of the arrow back sign
              left: 16,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.greenAccent, // Green background
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    // Navigate back to the previous screen (AccountTypeScreen)
                    Navigator.pop(context);
                  },
                ),
              ),
            ),

          // Main Form Content
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 120), // Lowered the form
              decoration: const BoxDecoration(
                color: Color(0xFF1A202C), // Background color for the form
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 15),
                      const Text(
                        'Job Seeker Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10), // Increased spacing
                      // Fullname Input
                      _buildInputField(hintText: 'Fullname'),
                      const SizedBox(height: 10), // Increased spacing
                      // Email Address Input
                      _buildInputField(hintText: 'Email Address'),
                      const SizedBox(height: 10), // Increased spacing
                      // Date of Birth Label
                      const Text(
                        'Date of Birth',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10), // Spaced further from label
                      // Date of Birth Input
                      Center(child: _buildInputField(hintText: 'MM/DD/YYYY')),
                      const SizedBox(height: 10), // Increased spacing
                      // Gender Selection
                      _buildSectionTitle('Gender'),
                      const SizedBox(height: 20), // Added spacing
                      _buildToggleButtons(['Male', 'Female'],
                          isIconLarger: true, borderThickness: 1.0),
                      const SizedBox(height: 10), // Increased spacing
                      // Employment Preference
                      _buildSectionTitle('Employment Preference'),
                      const SizedBox(height: 10), // Added spacing
                      _buildToggleButtons(['Part-Time', 'Full-Time'],
                          borderThickness: 1.0),
                      const SizedBox(height: 10), // Increased spacing
                      // Work Status
                      _buildSectionTitle('Work Status'),
                      const SizedBox(height: 10), // Added spacing
                      _buildToggleButtons(['Employed', 'Unemployed'],
                          borderThickness: 1.0),
                      const SizedBox(height: 50), // Added spacing before the button
                      // Confirm Button
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to Trabahanap screen when button is clicked
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => JobSearchScreen()), // Replace 'Trabahanap' with the actual screen widget
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyanAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 80.0),
                        ),
                        child: const Text(
                          'Confirm',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20), // Added spacing after button
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Input Field Builder
  Widget _buildInputField({required String hintText}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2D3748),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.transparent,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  // Section Title Builder
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Toggle Buttons Builder
Widget _buildToggleButtons(List<String> options,
    {bool isIconLarger = false, double borderThickness = 2.0}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: options.map((option) {
      return Expanded( // Ensures equal width for all buttons
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ElevatedButton(
            onPressed: () {
              // Toggle button logic
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1A202C), // Match fill-up form color
              side: BorderSide(color: Colors.cyanAccent, width: borderThickness),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // Centers content
              children: [
                Text(
                  option,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8), // Add space between the text and the icon
                if (option == 'Male')
                  Icon(Icons.male,
                      color: Colors.blueAccent,
                      size: isIconLarger ? 24 : 20),
                if (option == 'Female')
                  Icon(Icons.female,
                      color: Colors.pinkAccent,
                      size: isIconLarger ? 24 : 20),
                          ],
            ),
          ),
        ),
      );
    }).toList(),
  );
}

}
