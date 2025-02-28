import 'package:flutter/material.dart';
import 'qracc.dart';
void main() {
  runApp(QRReaderApp());
}

class QRReaderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QRReaderScreen(),
    );
  }
}

class QRReaderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF19202A), // Background color
      body: SafeArea(
        child: Column(
          children: [
            // Top header with back arrow and logo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back button
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF30D7A1),
                      shape: BoxShape.circle,
                    ),
                                        child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context); // This will pop the current screen and return to the previous one
                      },
                    )

                  ),
                  // Logo (Trabahanap)
                  Image.asset(
                    'assets/images/Trabahanap.png',
                    height: 100,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // Heading
            const Text(
              'QR Reader',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
            // QR code scanner with broken corners
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              decoration: BoxDecoration(
                color: const Color(0xFF19202A),
                borderRadius: BorderRadius.circular(16),
              ),
              child: CustomPaint(
                painter: FixedDashedBorderPainter(),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    'assets/images/sampleqr.png',
                    height: 200,
                  ),
                ),
              ),
            ),
            const Spacer(),
            // Single Container for Merged Buttons
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF2C3848), // Shared background color
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF19202A), // Shared background
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 20), // Adjust for centering
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Upload QR Button
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/uploadqr.png',
                                  height: 40,
                                  width: 40,
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Upload QR',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Show My QR Button
                          Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // Navigate to qracc.dart
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AccQr()), // Replace QRAccPage() with your qracc.dart widget
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/showmyqr.png',
                                  height: 40,
                                  width: 40,
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Show my QR',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Painter for Broken Corners
class FixedDashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    const double dashWidth = 70.0;

    // Top-left corner
    canvas.drawLine(const Offset(0, 0),const  Offset(dashWidth, 0), paint);
    canvas.drawLine(const Offset(0, 0),const Offset(0, dashWidth), paint);

    // Top-right corner
    canvas.drawLine(Offset(size.width, 0), Offset(size.width - dashWidth, 0), paint);
    canvas.drawLine(Offset(size.width, 0), Offset(size.width, dashWidth), paint);

    // Bottom-left corner
    canvas.drawLine(Offset(0, size.height), Offset(dashWidth, size.height), paint);
    canvas.drawLine(Offset(0, size.height), Offset(0, size.height - dashWidth), paint);

    // Bottom-right corner
    canvas.drawLine(Offset(size.width, size.height),
        Offset(size.width - dashWidth, size.height), paint);
    canvas.drawLine(Offset(size.width, size.height),
        Offset(size.width, size.height - dashWidth), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
