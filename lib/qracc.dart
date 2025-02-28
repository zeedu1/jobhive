import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AccQr(),
      debugShowCheckedModeBanner: false, // Removes the debug banner
    );
  }
}

class AccQr extends StatelessWidget {
  const AccQr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF19202A), // Main background color
      body: Column(
        children: [
          // Top Row with Arrow and Logo
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 30.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back Arrow Button
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF33D6A1), // Green background
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                // Trabahanap Logo
                SizedBox(
                  width: 100, // Adjust size here
                  height: 130,
                  child: Image.asset(
                    'assets/images/Trabahanap.png',
                    fit: BoxFit.contain, // Ensures the image scales well
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10), // Spacing after top row

          // "Account" Header
          const Text(
            'Account',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 1),

          // Main Content
          Expanded(
            child: Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF2C3848),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Color(0xFF383C3D),
                      child: Icon(Icons.person, size: 50, color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Tyrone Ken Pareja',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      '@username',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // QR Code
                    Container(
                      height: 200,
                      width: 200,
                      color: Colors.white,
                      child: Image.asset(
                        'assets/images/sampleqr.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Add QR Download functionality here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0ACEDE),
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Download QR'),
                          SizedBox(width: 8),
                          Icon(Icons.download),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
