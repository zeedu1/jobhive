import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1a202c), // Background color of the screen
      appBar: AppBar(
        backgroundColor: const Color(0xFF1a202c), // Set AppBar background color to #1a202c
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.only(left: 16.0), // Add left margin for the arrow
          decoration:const BoxDecoration(
            color:  Color(0xFF34d5a1), // Background color behind the arrow
            shape: BoxShape.circle, // Make the container circular
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black), // Set arrow icon color to black
            onPressed: () {
              Navigator.pop(context); // Pops the current screen and navigates back to the previous screen
            },
          ),

        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white, 
            fontSize: 24, // Increased font size for "Profile"
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 16.0), // Add top margin to push the form down
        decoration:const BoxDecoration(
          color:  Color(0xFF2e3748), // Background color behind the entire profile form
          borderRadius:  BorderRadius.only(
            topLeft: Radius.circular(30), // Rounded corners at the top-left
            topRight: Radius.circular(30), // Rounded corners at the top-right
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
              const SizedBox(height: 24),
              const ProfileField(label: 'Fullname', placeholder: 'Tyrone Ken Pareja'),
              const SizedBox(height: 16),
              const ProfileField(label: 'Email', placeholder: 'tyrlken@gmail.com'),
              const SizedBox(height: 16),
              const ProfileField(
                label: 'Gender',
                placeholder: 'Male',
                isSmall: true, // Small width field
                isLeftAligned: true, // Align the textfield to the left
                suffixIcon: Icons.male, // Add male icon to the right of the text field
                iconColor: Color(0xFF9cc0e2), // Set the color of the icon
              ),
              const SizedBox(height: 16),
              const ProfileField(
                label: 'Employment Preference',
                placeholder: 'Part-Time',
                isSmall: true, // Small width field
                isLeftAligned: true, // Align the textfield to the left
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Apply 20% border radius
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16), // Increase width of the button
                ),
                onPressed: () {}, // Implement logout functionality
                child: const Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 16, 
                    fontWeight: FontWeight.bold, 
                    color: Colors.black, // Change the text color to black
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileField extends StatelessWidget {
  final String label;
  final String placeholder;
  final bool isSmall;
  final bool isLeftAligned;
  final IconData? suffixIcon; // Optional icon parameter for suffix
  final Color? iconColor; // Optional icon color parameter

  const ProfileField({
    required this.label,
    required this.placeholder,
    this.isSmall = false, // Defaults to full-width field
    this.isLeftAligned = false, // Default alignment is center
    this.suffixIcon, // Optional icon for suffix
    this.iconColor, // Optional icon color
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0), // Add left margin to the label
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Align(
          alignment: isLeftAligned ? Alignment.centerLeft : Alignment.center,
          child: SizedBox(
            width: isSmall ? 100 : double.infinity, // Adjust width for small fields
            child: TextField(
              textAlign: isLeftAligned ? TextAlign.start : TextAlign.center, // Align text left for certain fields
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF1a202c), // Set background color of text fields
                hintText: placeholder,
                hintStyle: TextStyle(color: Colors.grey[400]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: suffixIcon != null
                    ? Icon(suffixIcon, color: iconColor ?? Colors.white) // Use the icon color if provided
                    : null, // Add the icon here
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
