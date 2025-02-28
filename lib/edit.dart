import 'package:flutter/material.dart';

class EditPostPage extends StatelessWidget {
  const EditPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B1E25), // Background color
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF1B1E25),
        leading: Center( // Center the button inside the app bar
          child: Container(
            margin: const EdgeInsets.only(left: 10.0), // Margin for spacing
            width: 40, // Equal width and height for a circle
            height: 40,
            decoration: BoxDecoration(
              color: Colors.green, // Green background
              shape: BoxShape.circle, // Use circle shape to enforce perfect circle
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context); // Navigate back
              },
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40), // Margin top 40
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF2F3849), // Background color for the entire body
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), // 30% rounded corner on top-left
              topRight: Radius.circular(30), // 30% rounded corner on top-right
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Edit Post',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Job Title
                buildInputField('Job Title'),
                const SizedBox(height: 16),
                // Location
                buildInputField('Location'),
                const SizedBox(height: 16),
                // Monthly Salary
                buildInputField('Monthly Salary'),
                const SizedBox(height: 24),
                // Job Type
                Center(
                  child: Text(
                    'Job Type:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildJobTypeButton('Part-Time', false),
                    buildJobTypeButton('Full-Time', true),
                  ],
                ),
                const SizedBox(height: 24),
                // Job Description
                Center(
                  child: Text(
                    'Job Description',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A2D37),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    maxLines: 4,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Write your description here',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const Spacer(),
                // Confirm Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Confirm button functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan, // Button background color
                      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Confirm',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build input fields
  Widget buildInputField(String hintText) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2D37),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }

  // Helper method to build job type buttons
  // Helper method to build job type buttons
Widget buildJobTypeButton(String text, bool isSelected) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    decoration: BoxDecoration(
      color: Colors.transparent, // Always transparent
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.cyan),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.white, // Always white text
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: EditPostPage(),
  ));
}
