import 'package:flutter/material.dart';
import 'trabahanap.dart';
import 'signup.dart';
void main() {
  runApp(ManagerProfileApp());
}

class ManagerProfileApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ManagerProfileScreen(),
    );
  }
}

class ManagerProfileScreen extends StatefulWidget {
  @override
  ManagerProfileScreenState createState() => ManagerProfileScreenState();
}

class ManagerProfileScreenState extends State<ManagerProfileScreen> {
  final List<String> industries = [
    "Office",
    "Technology",
    "Healthcare",
    "Food",
    "Production",
    "Education",
    "Finance",
    "Entertainment",
  ];

  String selectedIndustry = "";
  TextEditingController otherIndustryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111827), // Full Background Color
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 120), // Adjust to account for back arrow
                _buildManagerProfileForm(),
              ],
            ),
          ),
          _buildBackButton(), // Positioned outside the form
        ],
      ),
    );
  }

  // Back Button Positioned Outside
  Widget _buildBackButton() {
  return Positioned(
    top: 60,
    left: 20,
    child: Container(
      decoration: const BoxDecoration(
        color: Color(0xFF00FFA3),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          // Pass the userType when navigating to SignUpScreen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SignUpScreen(userType: 'Manager'), // Pass the appropriate userType value
            ),
          );
        },
      ),
    ),
  );
}


  // Manager Profile Form
  Widget _buildManagerProfileForm() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        color: Color(0xFF1F2937),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60), // Adjusted for rounded effect
          topRight: Radius.circular(60),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              "Manager Profile",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          _buildInputField("Company name"),
          const SizedBox(height: 15),
          _buildInputField("Email Address"),
          const SizedBox(height: 15),
          _buildDateInputField(),
          const SizedBox(height: 10),
          Center(child: _buildSectionTitle("Specify your Industry")),
          const SizedBox(height: 20),// Buttons placed immediately below title
          _buildIndustryButtons(), 
          const SizedBox(height: 20),
          _buildOtherIndustryField(),
          const SizedBox(height: 30),
          Center(
            child: _buildConfirmButton(context),  // Pass context here
          ),
        ],
      ),
    );
  }

  // Input Field
  Widget _buildInputField(String hint) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF111827),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }

  // Date Input Field (Centered)
  Widget _buildDateInputField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Founding Date",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF111827),
            hintText: "MM/DD/YYYY",
            hintStyle: const TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none,
            ),
          ),
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  // Section Title
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildIndustryButtons() {
  return Center(  // This will center the Wrap widget
    child: Wrap(
      spacing: 10, // Horizontal space between buttons
      runSpacing: 10, // Vertical space between buttons
      alignment: WrapAlignment.center,  // Center the items within the Wrap
      children: industries.map((industry) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndustry = industry;
            });
          },
          child: FractionallySizedBox(
            widthFactor: 0.45, // This limits the width of each button
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                color: selectedIndustry == industry
                    ? const Color(0xFF00FFA3)
                    : const Color(0xFF111827),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFF00FFA3),
                  width: 1.0,
                ),
              ),
              child: Text(
                industry,
                style: TextStyle(
                  color: selectedIndustry == industry
                      ? Colors.black
                      : Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}



  // Other Industry Field
  Widget _buildOtherIndustryField() {
    return Row(
      children: [
        const Text(
          "Other:",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: otherIndustryController,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFF111827),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
            ),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  // Confirm Button
    Widget _buildConfirmButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigate to Search screen when button is clicked
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TrabahanapApp()), // Replace with your actual SearchScreen widget
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF00FFA3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
      ),
      child: const Text(
        "Confirm",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

}
