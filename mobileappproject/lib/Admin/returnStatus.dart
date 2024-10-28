import 'package:flutter/material.dart';
import 'package:mobileappproject/Admin/adminAssetlist.dart';
import 'package:mobileappproject/Admin/adminHistory.dart';
import 'package:mobileappproject/login.dart';

class Returnstatus extends StatelessWidget {
  const Returnstatus({super.key});

  // Function for logout dialog
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

                // Borrower row
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
                          'Borrower',
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
          automaticallyImplyLeading: false,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Adminassetlist()),
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Returnstatus()),
                );
                break;
              case 2:
                showModalBottomSheet(
                  //dashboard ก็อปตัวนี้ได้เลย
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return DashboardWidget(); // Show the DashboardWidget as a bottom sheet
                  },
                );
                break;
              case 3:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Adminhistory()),
                );
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
                      'Return status',
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFF191919),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.check_box_outlined , // Clock icon
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
                  status: 'For rent', // Custom status
                  statusColor: Colors.orange,
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
                  status: 'For rent', // Custom status
                  statusColor: Colors.orange,
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
                  status: 'For rent', // Custom status
                  statusColor: Colors.orange,
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
                  status: 'For rent', // Custom status
                  statusColor: Colors.orange,
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
                  status: 'For rent', // Custom status
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
    String status = "Approved",
    Color statusColor = Colors.green,
    String dateRange = "10/19/2024 - 11/19/2024",
  }) {
    return GestureDetector(
      onTap: () {
        // Trigger the dialog when the card is pressed
        _showHistoryDetailsDialog(
          context,
          carName,
          dateRange,
          'John Smith',
          status,
          Icons.person,
          statusColor,
        );
      },
      child: Container(
        height: 220,
        decoration: BoxDecoration(
          color: const Color(0xFFE8E8F2),
          borderRadius: BorderRadius.circular(20),
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
                      shape: BoxShape.circle,
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
            // Buttons aligned to the right
            Positioned(
              right: 10, // Align buttons to the right
              bottom: 0, // Place it closer to the bottom
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _showConfirmationDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 87, 159, 218),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 2), // ลด padding แนวตั้งเพื่อให้ปุ่มเตี้ยลง
                      minimumSize:
                          const Size(80, 28), // กำหนดขนาดขั้นต่ำของปุ่ม
                    ),
                    child: const Text(
                      "Return",
                      style: TextStyle(
                        fontSize: 12, // ขนาดตัวอักษรเท่าเดิม
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8), // Spacing between buttons
                  ElevatedButton(
                    onPressed: () {
                      _showConfirmationDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 2), // ลด padding แนวตั้งเพื่อให้ปุ่มเตี้ยลง
                      minimumSize:
                          const Size(80, 28), // กำหนดขนาดขั้นต่ำของปุ่ม
                    ),
                    child: const Text(
                      "Late",
                      style: TextStyle(
                        fontSize: 12, // ขนาดตัวอักษรเท่าเดิม
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
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

  void _showCompleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        contentPadding: const EdgeInsets.all(20),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.check_circle_outline_rounded,
              size: 150,
              color: Color.fromARGB(255, 113, 218, 116),
            ),
            const SizedBox(height: 5),
            const Text(
              'Complete!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'You have change the status!',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontFamily: 'Montserrat',
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // จัดให้อยู่ตรงกลาง
              children: [
                TextButton(
                  onPressed: () {
                    // Close the current dialog
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.black), // Black border
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // ปรับขนาดภายในปุ่ม
                  ),
                  child: const Text(
                    "OK",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        );
      },
    );
  }

  void _showConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        contentPadding: const EdgeInsets.all(20),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline_outlined,
              size: 150,
              color: Color.fromARGB(255, 252, 185, 84),
            ),
            const SizedBox(height: 5),
            const Text(
              'Are you sure?',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'You want to change the status?',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontFamily: 'Montserrat',
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // จัดให้อยู่ตรงกลาง
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Close the current dialog
                    Navigator.of(context).pop();
                    // Show Complete Dialog after Yes is pressed
                    _showCompleteDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10), // ปรับขนาดภายในปุ่ม
                  ),
                  child: const Text(
                    "Yes",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
                const SizedBox(width: 8), // เพิ่มระยะห่างระหว่างปุ่ม
                TextButton(
                  onPressed: () {
                    // Close the current dialog
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.black), // Black border
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // ปรับขนาดภายในปุ่ม
                  ),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}


}

class DashboardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 410,
        width: 500,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Text(
                        'Dashboard',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF191919),
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.bar_chart_outlined,
                        size: 27,
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.black),
                    onPressed: () {
                      Navigator.of(context).pop(); // ปิดแท็บเมื่อคลิกกากบาท
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildDashboardCard(
                  icon: Icons.check_circle,
                  color: Colors.green,
                  title: 'Total Car available',
                  value: '> 11',
                ),
                const SizedBox(width: 10),
                buildDashboardCard(
                  icon: Icons.cancel,
                  color: Colors.red,
                  title: 'Total Car unavailable',
                  value: '> 7',
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildDashboardCard(
                  icon: Icons.open_in_new,
                  color: Colors.orange,
                  title: 'Total Rent',
                  value: '> 13',
                ),
                const SizedBox(width: 10),
                buildDashboardCard(
                  icon: Icons.access_time,
                  color: Colors.black,
                  title: 'Total Pending',
                  value: '> 6',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDashboardCard(
      {required IconData icon,
      required Color color,
      required String title,
      required String value}) {
    return Container(
      width: 190,
      height: 152,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 60),
          const SizedBox(height: 5),
          Text(title,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat')),
          Text(value,
              style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat')),
        ],
      ),
    );
  }
}