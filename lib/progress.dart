import 'package:flutter/material.dart';

void main() {
  runApp(JobProgressApp());
}

class JobProgressApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JobProgressScreen(),
    );
  }
}

class JobProgressScreen extends StatefulWidget {
  @override
  _JobProgressScreenState createState() => _JobProgressScreenState();
}

class _JobProgressScreenState extends State<JobProgressScreen> {
  int selectedIndex = 0;
  final List<String> tabs = ['Saved', 'Applied', 'Interview', 'Hired'];

  final List<List<Widget>> jobCardLists = [
  // Saved tab
  [
    const JobCardSaved(
      jobTitle: 'Civil Engineer',
      company: 'AAA Company',
      location: 'New Pandan',
    ),
    const JobCardSaved(
      jobTitle: 'Graphic Designer',
      company: 'ARA Company',
      location: 'Salvacion',
    ),
  ],
  // Applied tab
  [
    const JobCardApplied(
      jobTitle: 'Civil Engineer',
      company: 'AAA Company',
      location: 'New Pandan',
      status: JobStatus.pending,
    ),
    const JobCardApplied(
      jobTitle: 'Graphic Designer',
      company: 'ARA Company',
      location: 'Salvacion',
      status: JobStatus.approved,
    ),
    const JobCardApplied(
      jobTitle: 'Civil Engineer',
      company: 'LDR Company',
      location: 'Malitbog',
      status: JobStatus.rejected,
    ),
  ],
  // Interview tab
  [
    const JobCardInterview(
      jobTitle: 'Graphic Designer',
      company: 'ARA Company',
      location: 'Salvacion',
      scheduleDate: 'December 31, 2024',
      scheduleTime: '11:59 PM',
    ),
  ],
  // Hired tab
  [
    const JobCardHired(
      jobTitle: 'Civil Engineer',
      company: 'AAA Company',
      location: 'New Pandan',
      hiredDate: 'December 20, 2024',
      hiredTime: '10:00 AM',
    ),
  ],
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF19202A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF19202A),
        elevation: 0,
        centerTitle: true,
        leading: Container(
          margin: const EdgeInsets.only(left: 12),
          decoration: const BoxDecoration(
            color: Color(0xFF30D89D),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: const Text(
          'Job Progress',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF2C3848),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(tabs.length, (index) {
                  final bool isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () => setState(() => selectedIndex = index),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF19202A)
                            : const Color(0xFF2C3848),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Text(
                        tabs[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.white70,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF2E3748),
                borderRadius: BorderRadius.circular(30),
              ),
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                children: jobCardLists[selectedIndex],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum JobStatus { pending, approved, rejected }

class JobCardSaved extends StatelessWidget {
  final String jobTitle;
  final String company;
  final String location;

  const JobCardSaved({
    Key? key,
    required this.jobTitle,
    required this.company,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF19202A),
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  jobTitle,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  company,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  location,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(Icons.bookmark, color: Colors.white),
              const SizedBox(height: 20),
              ApplyButton(),
            ],
          ),
        ],
      ),
    );
  }
}

class JobCardApplied extends StatelessWidget {
  final String jobTitle;
  final String company;
  final String location;
  final JobStatus status;

  const JobCardApplied({
    Key? key,
    required this.jobTitle,
    required this.company,
    required this.location,
    required this.status,
  }) : super(key: key);

  String get statusText {
    switch (status) {
      case JobStatus.pending:
        return 'Pending';
      case JobStatus.approved:
        return 'Approved';
      case JobStatus.rejected:
        return 'Rejected';
    }
  }

  Color get statusColor => const Color(0xFF30D7A1);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF19202A),
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  jobTitle,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  company,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  location,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              const Text(
                'Status:',
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text(
                  statusText,
                  style: const TextStyle(
                    color: Colors.white, // Change status text to white
                    fontWeight: FontWeight.bold,
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

class JobCardInterview extends StatelessWidget {
  final String jobTitle;
  final String company;
  final String location;
  final String scheduleDate;
  final String scheduleTime;

  const JobCardInterview({
    Key? key,
    required this.jobTitle,
    required this.company,
    required this.location,
    required this.scheduleDate,
    required this.scheduleTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF19202A), // Main background color for the card
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            jobTitle,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            company,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            location,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 10),
          // Centered the Interview Schedule on text
          const Center(
            child: Text(
              'Interview Schedule on:',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
          ),
          const SizedBox(height: 6),
          // Added background color to the date, time, and button section
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF2E3748), // Background color for this section
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Text(
                  scheduleDate,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4), // Space between date and time
                Text(
                  scheduleTime,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                // Copy link button with the new background color
                CopyMeetingLinkButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class JobCardHired extends StatelessWidget {
  final String jobTitle;
  final String company;
  final String location;
  final String hiredDate;
  final String hiredTime;

  const JobCardHired({
    Key? key,
    required this.jobTitle,
    required this.company,
    required this.location,
    required this.hiredDate,
    required this.hiredTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF19202A), // Main background color for the card
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Job card header with "X" button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Graphic Designer',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Handle the "X" button press here (e.g., close the card)
                },
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            'ARA Company', // Updated company name
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            'Salvacion', // Updated location
            style:  TextStyle(
              fontSize: 12,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 10),
          // Replacing "Hired Date and Time" with "Messages"
          const Center(
            child: Text(
              'Messages:',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white70,
              ),
            ),
          ),
          const SizedBox(height: 2),
          // Display the congratulatory message and meeting link
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF2E3748), // Background color for the message section
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(12),
            child: const Column(
              children: [
                Text(
                  'Congratulations! You have been hired for the Graphic Designer position.\n'
                  'Your employment will commence on January 1, 2025.\n'
                  'We look forward to seeing you soon!',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5),
                // Added the "Copy Meeting Link" button
              ],
            ),
          ),
        ],
      ),
    );
  }
}





class CopyMeetingLinkButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF54C6A2), // Retained original color #54c6a2 for the button
          borderRadius: BorderRadius.circular(24),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Copy Meeting Link',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 8), // Space between the text and icon
            Icon(
              Icons.link,
              color: Colors.white,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}





class ApplyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF32D6A1),
        borderRadius: BorderRadius.circular(24),
      ),
      child: const Text(
        'Apply',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), // Change to white
      ),
    );
  }
}

