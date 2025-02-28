import 'package:flutter/material.dart';

void main() {
  runApp(const ApplicationApp());
}

class ApplicationApp extends StatelessWidget {
  const ApplicationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ApplicationScreen(),
    );
  }
}

class ApplicationScreen extends StatelessWidget {
  const ApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1a202c), // Background color of the screen
      appBar: AppBar(
        backgroundColor: const Color(0xFF1a202c), // Set AppBar background color to #1a202c
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.only(left: 16.0), // Add left margin for the arrow
          decoration: const BoxDecoration(
            color: Color(0xFF34d5a1), // Background color behind the arrow
            shape: BoxShape.circle, // Make the container circular
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context); // This will go back to the previous screen in the navigation stack
            },
          )
        ),
        title: const Text(
          'Application',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24, // Increased font size for "Application"
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 16.0), // Add top margin to push the form down
        decoration: const BoxDecoration(
          color: Color(0xFF2e3748), // Background color behind the entire profile form
          borderRadius: BorderRadius.only(
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
              const ProfileField(label: 'Fullname', placeholder: 'Tyrone Ken Pareja'),
              const SizedBox(height: 16),
              const ProfileField(label: 'Email', placeholder: 'tyrlken@gmail.com'),
              const SizedBox(height: 16),
              const ProfileField(
                label: 'Contact #',
                placeholder: '0917-123-4567', // Updated placeholder
                isSmall: false, // Full width, same as Email field
              ),
              const SizedBox(height: 32),
              // Upload Resume Section
              const SizedBox(
                width: double.infinity,
                child: TextField(
                  readOnly: true, // Prevent keyboard from popping up
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF1a202c), // Set background color
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)), // Rectangle shape with slight rounding
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 50), // Adjust padding for height
                    hintText: '', // Remove default hint text
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.upload, color: Colors.white, size: 36), // Increase size to 36
                          SizedBox(height: 8), // Space between icon and text
                          Text(
                            'Upload Resume',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    prefixIconConstraints: BoxConstraints(
                      minWidth: 0, // Adjust minimum width to fit content
                      minHeight: 0,
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center, // Ensures any input aligns to center
                ),
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
                onPressed: () {}, // Implement submit functionality
                child: const Text(
                  'Submit your application',
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

  const ProfileField({
    required this.label,
    required this.placeholder,
    this.isSmall = false, // Defaults to full-width field
    this.isLeftAligned = false, // Default alignment is center
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
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
