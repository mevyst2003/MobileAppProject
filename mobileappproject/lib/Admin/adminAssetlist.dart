import 'package:flutter/material.dart';
import 'package:mobileappproject/Admin/adminHistory.dart';
import 'package:mobileappproject/Admin/adminSelectCar.dart';
import 'package:mobileappproject/Admin/returnStatus.dart';
import 'package:mobileappproject/login.dart';

class Adminassetlist extends StatefulWidget {
  const Adminassetlist({super.key});

  @override
  State<Adminassetlist> createState() => _AdminassetlistState();
}

class _AdminassetlistState extends State<Adminassetlist> {
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
                child: Text(
                  'Choose your car type',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF191919),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Car type selection for Sedan
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: _buildCarTypeCard(
                  context,
                  imagePath: 'assets/images/Sedan.png',
                  carType: 'Sedan',
                  imageWidth: 330,
                  imageHeight: 120,
                ),
              ),
              const SizedBox(height: 16),

              // Car type selection for SUV
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: _buildCarTypeCard(
                  context,
                  imagePath: 'assets/images/SUV.png',
                  carType: 'SUV',
                  imageWidth: 330,
                  imageHeight: 120,
                ),
              ),
              const SizedBox(height: 16),

              // Car type selection for Pick-up
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: _buildCarTypeCard(
                  context,
                  imagePath: 'assets/images/Pick-Up.png',
                  carType: 'Pick-Up',
                  imageWidth: 330,
                  imageHeight: 120,
                ),
              ),
              const SizedBox(height: 16),

              // Car type selection for EV
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: _buildCarTypeCard(
                  context,
                  imagePath: 'assets/images/EV.png',
                  carType: 'EV',
                  imageWidth: 330,
                  imageHeight: 120,
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

// Helper method to build car type cards with navigation
  Widget _buildCarTypeCard(
    BuildContext context, {
    required String imagePath,
    required String carType,
    required double imageWidth,
    required double imageHeight,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Adminselectcar(carType: carType)),
        );
      },
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: const Color(0xFFE8E8F2),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: imageWidth,
              height: imageHeight,
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              carType,
              style: const TextStyle(
                color: Color(0xFF191919),
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
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
    return Align(
      alignment: Alignment.bottomCenter, // จัดตำแหน่งที่ล่างกลาง
      child: Container(
        height: 400, // ปรับความสูงตามต้องการ
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
            const Padding(
              padding: EdgeInsets.only(left: 16), // ปรับ padding ด้านซ้ายที่นี่
              child: Row(
                children: [
                  Text(
                    'Dashboard',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF191919),
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  Icon(
                    Icons.bar_chart_outlined,
                    size: 27,
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // กล่องแรก
                buildDashboardCard(
                  icon: Icons.check_circle,
                  color: Colors.green,
                  title: 'Total Car available',
                  value: '> 11',
                ),
                const SizedBox(width: 10),
                // กล่องสอง
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
                // กล่องสาม
                buildDashboardCard(
                  icon: Icons.open_in_new,
                  color: Colors.orange,
                  title: 'Total Rent',
                  value: '> 13',
                ),
                const SizedBox(width: 10),
                // กล่องสี่
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

  Widget buildDashboardCard({required IconData icon, required Color color, required String title, required String value}) {
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
          Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'Montserrat')),
          Text(value, style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold, fontFamily: 'Montserrat')),
        ],
      ),
    );
  }
}