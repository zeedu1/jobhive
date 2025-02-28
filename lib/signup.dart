import 'package:flutter/material.dart';
import 'fill_up.dart';  // Import the FillUpScreen or your next screen
  // Import the JobSeekerProfileScreen or your next screen
import 'manager.dart';
import 'login.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(userType: 'jobseeker'), // Pass a value for userType here
    );
  }
}

class SignUpScreen extends StatelessWidget {
  final String userType; // Receive the userType

  SignUpScreen({required this.userType}); // Constructor with userType parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A202C), // Main background color
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100.0, bottom: 30.0),
                  child: Image.asset(
                    'assets/images/Trabahanap.png',  // Make sure the image exists
                    height: 200,
                  ),
                ),
              ),
              // Sign Up Form Container
              Container(
                width: double.infinity, // Fullscreen width
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 200,
                ), // Full height minus top space for logo
                decoration: const BoxDecoration(
                  color: Color(0xFF2E3748), // Form background color
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70.0), // 50% border radius on right
                  ),
                ),
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Arrow Back Icon with Green Background
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.greenAccent, // Green background
                        borderRadius: BorderRadius.circular(50.0), // Circle shape
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black), // Black arrow
                        onPressed: () {
                          // Pop the current screen off the stack and navigate back
                          Navigator.pop(context);
                        },
                      ),
                    ),

                    const SizedBox(height: 20),
                    // Sign Up Title
                    const Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Username TextField
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                          hintText: 'Username',
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Password TextField
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                          hintText: 'Password',
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Next Button
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Conditional navigation based on userType
                          if (userType == 'jobseeker') {
                            // Navigate to the JobSeekerProfileScreen
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => JobSeekerProfileScreen()), // Replace with your actual screen
                            );
                          } else if (userType == 'manager') {
                            // Navigate to the ManagerScreen
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ManagerProfileScreen()), // Replace with your actual screen
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.tealAccent,
                          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    // Already have an account?
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an Account? ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          GestureDetector(
                          onTap: () {
                            // Navigate to LogInScreen when 'Click here' is tapped
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LogInScreen()),
                            );
                          },
                          child: const Text(
                            'Click here',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),

                        ],
                      ),
                    ),
                    const SizedBox(height: 30), // Extra spacing for bottom padding
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

