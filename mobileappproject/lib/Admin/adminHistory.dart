import 'package:flutter/material.dart';
import 'package:mobileappproject/Admin/adminAssetlist.dart';
import 'package:mobileappproject/Admin/returnStatus.dart';
import 'package:mobileappproject/Borrower/Cartypelist1.dart';
import 'package:mobileappproject/Borrower/History.dart';
import 'package:mobileappproject/login.dart';

class Adminhistory extends StatelessWidget {
  const Adminhistory({super.key});

  void _showHistoryDetailsDialog(
      BuildContext context,
      String carName,
      String dateRange,
      String approver,
      String status,
      IconData icon,
      Color statusColor) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors
              .white, // Corrected to set the dialog background color to white
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Rounded corners
          ),
          insetPadding: const EdgeInsets.all(16), // Adjust padding as needed
          child: Padding(
            padding: const EdgeInsets.only(
                left: 24.0,
                right: 16.0,
                top: 16.0,
                bottom: 16.0), // Left padding added here
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // History detail title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "History detail",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Car information row
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.directions_car, size: 30),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          carName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        const Text(
                          'Type Sedan',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Borrow date range row
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.calendar_today, size: 30),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Borrow $dateRange',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        const Text(
                          'Return 20/10/2024',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Approver row
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.person, size: 30),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Approver',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              approver,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: statusColor, // Approver status color
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0), // Rounded corners
          ),
          backgroundColor: Colors.white,
          contentPadding: const EdgeInsets.all(24), // Adjust padding as needed
          content: Container(
            width:
                MediaQuery.of(context).size.width * 0.8, // 80% of screen width
            child: const Column(
              mainAxisSize:
                  MainAxisSize.min, // Ensure it only takes up necessary space
              children: [
                // Title
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Good luck :)',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 35,
                          fontFamily: 'Montserrat',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Are you sure you want to log out?',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                // Reduced space between the text and buttons
                SizedBox(height: 0), // Adjust space between text and buttons
              ],
            ),
          ),
          actionsAlignment: MainAxisAlignment.center, // Center the buttons
          actions: [
            // "Log out" button with custom style
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.black, // Black background for Log out button
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13.0), // Rounded corners
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const Login()),
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text(
                'Log out',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  color: Colors.white, // White text color
                ),
              ),
            ),
            // "Cancel" button with border style
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.black), // Black border
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13.0), // Rounded corners
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  color: Colors.black, // Black text color
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191919),
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(100), // Increase the height of AppBar
        child: AppBar(
          elevation: 0.0, // Remove elevation to make it flush with the body
          backgroundColor: const Color(0xFF191919),
          flexibleSpace: const Padding(
            padding: EdgeInsets.symmetric(
                vertical: 16.0), // Adjust padding to center title properly
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    'Hertz Rental',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  Text(
                    '.',
                    style: TextStyle(
                      fontSize: 45,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 65, // Set the height of the Bottom Navigation Bar
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFF191919),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          currentIndex: 0,
          onTap: (index) {
            switch (index) {
              case 0:
                Navigator.pop(context);
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Returnstatus()),
                );
                break;
              case 2:
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return DashboardWidget(); // Show the DashboardWidget as a bottom sheet
                  },
                );
                break;
              case 3:
                break;
              case 4:
                _showLogoutDialog(context);
                break;
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.time_to_leave),
              label: 'Car list',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.date_range_outlined),
              label: 'Return',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_outlined),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app),
              label: 'Log out',
            ),
          ],
          selectedLabelStyle: const TextStyle(
            fontSize: 13.5,
          ), // Change font size for selected label
          unselectedLabelStyle: const TextStyle(
              fontSize: 13), // Change font size for unselected label
        ),
      ),
      body: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25.0), // Rounded top-left corner
          topRight: Radius.circular(25.0), // Rounded top-right corner
        ),
        child: Container(
          color: Colors.white,
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                    top: 24.0,
                    left: 32.0,
                    right: 16.0), // Adjusted padding for "Choose your car type"
                child: Row(
                  children: [
                    Text(
                      'History',
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFF191919),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.access_time, // Clock icon
                      color: Color(0xFF191919),
                      size: 25,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Car type selection for Sedan
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: _buildCarTypeCard(
                  context,
                  imagePath: 'assets/images/Sedan.png',
                  carName: 'Toyota Avalon Trim',
                  imageWidth: 340,
                  imageHeight: 120,
                  status: 'Approved', // Custom status
                  statusColor: Colors.green,
                  dateRange: '19/10/2024 - 20/10/2024',
                ),
              ),
              const SizedBox(height: 16),

              // Car type selection for SUV
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: _buildCarTypeCard(
                  context,
                  imagePath: 'assets/images/Sedan.png',
                  carName: 'Toyota Avalon Trim',
                  imageWidth: 340,
                  imageHeight: 120,
                  status: 'Disapproved', // Custom status
                  statusColor: Colors.red,
                  dateRange: '19/10/2024 - 20/10/2024',
                ),
              ),
              const SizedBox(height: 16),

              // Car type selection for Pick-up
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: _buildCarTypeCard(
                  context,
                  imagePath: 'assets/images/Sedan.png',
                  carName: 'Toyota Avalon Trim',
                  imageWidth: 340,
                  imageHeight: 120,
                  status: 'Pending', // Custom status
                  statusColor: Colors.yellow,
                  dateRange: '19/10/2024 - 20/10/2024',
                ),
              ),
              const SizedBox(height: 16),

              // Car type selection for EV
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: _buildCarTypeCard(
                  context,
                  imagePath: 'assets/images/Sedan.png',
                  carName: 'Toyota Avalon Trim',
                  imageWidth: 340,
                  imageHeight: 120,
                  status: 'Returned', // Custom status
                  statusColor: Colors.blue,
                  dateRange: '19/10/2024 - 20/10/2024',
                ),
              ),
              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: _buildCarTypeCard(
                  context,
                  imagePath: 'assets/images/Sedan.png',
                  carName: 'Toyota Avalon Trim',
                  imageWidth: 340,
                  imageHeight: 120,
                  status: 'Lated', // Custom status
                  statusColor: Colors.orange,
                  dateRange: '19/10/2026 - 20/10/2024',
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

// Helper method to build car type cards
  // Updated _buildCarTypeCard to include GestureDetector
  Widget _buildCarTypeCard(
    BuildContext context, {
    required String imagePath,
    required String carName,
    required double imageWidth,
    required double imageHeight,
    String status = "Approved", // Status text
    Color statusColor = Colors.green, // Status indicator color
    String dateRange = "10/19/2024 - 11/19/2024", // Example date range
  }) {
    return GestureDetector(
      onTap: () {
        // Trigger the dialog when the card is pressed
        _showHistoryDetailsDialog(
          context,
          carName,
          dateRange,
          'John Smith', // Example approver
          status,
          Icons.person, // Example icon
          statusColor,
        );
      },
      child: Container(
        height: 220,
        decoration: BoxDecoration(
          color: const Color(0xFFE8E8F2),
          borderRadius: BorderRadius.circular(20), // Rounded corners
        ),
        child: Stack(
          children: [
            // Status text and circle in the top-right corner
            Positioned(
              top: 10,
              right: 20,
              child: Row(
                children: [
                  Text(
                    status,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  const SizedBox(width: 5), // Space between text and circle
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: statusColor, // Status color
                      shape: BoxShape.circle, // Circular shape
                    ),
                  ),
                ],
              ),
            ),
            // Centered car image
            Center(
              child: Container(
                width: imageWidth,
                height: imageHeight,
                margin: const EdgeInsets.only(
                    bottom: 40, top: 10), // Add margin for spacing
                child: Transform(
                  transform: Matrix4.identity()
                    ..scale(-1.0, 1.0), // Flip image horizontally
                  alignment: Alignment.center,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            // Text aligned to the left
            Positioned(
              left: 30, // Align text to the left
              bottom: 20, // Place it closer to the bottom
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align left
                children: [
                  Text(
                    carName,
                    style: const TextStyle(
                      color: Color(0xFF191919),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  const SizedBox(
                      height: 2), // Increased spacing between car name and date
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 15,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        dateRange,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ],
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

class DashboardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 500, // Adjust height as needed
        width: 500,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Row(
              children: [
                Text(
                  'Dashboard',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF191919),
                  ),
                ),
                Icon(Icons.bar_chart_outlined)
              ],
            ),
            const SizedBox(height: 16),
            Row(
              // หน้าป๊อปอัพที่ขึ้นมาของ dashboard
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  //กล่องแรก
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: 2),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 24,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Total Car available',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '> 11',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  width: 150,
                  height: 150,
                  //กล่องสอง
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: 2),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.cancel,
                        color: Colors.red,
                        size: 24,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Total Car unavailable',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '> 7',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  //กล่องสาม
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: 2),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.open_in_new,
                        color: Colors.orange,
                        size: 24,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Total Rent',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '> 13',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  width: 150,
                  height: 150,
                  //กล่องสี่
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: 2),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.access_time,
                        color: Colors.black,
                        size: 24,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Total Pending',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '> 6',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
