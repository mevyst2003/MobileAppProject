import 'package:flutter/material.dart';
import 'package:mobileappproject/Admin/adminHistory.dart';
import 'package:mobileappproject/Admin/adminRequestBorrowCarEdit.dart';
import 'package:mobileappproject/Admin/returnStatus.dart';
import 'package:mobileappproject/login.dart';

class Adminselectcar extends StatelessWidget {
  final String carType;

  const Adminselectcar({super.key, required this.carType});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          backgroundColor: Colors.white,
          contentPadding: const EdgeInsets.all(24),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                SizedBox(height: 0),
              ],
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13.0),
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
                  color: Colors.white,
                ),
              ),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.black),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13.0),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  List<Widget> buildCarList(BuildContext context, String carType) {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: _buildCarTypeCard(
          context,
          imagePath: 'assets/images/$carType.png',
          carType: carType,
          carBrand: 'Toyota',
          carModel: 'Avalon Trim',
          carPrice: 1500,
          imageWidth: 340,
          imageHeight: 120,
          carStatus: Colors.green,
        ),
      ),
      const SizedBox(height: 16),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: _buildCarTypeCard(
          context,
          imagePath: 'assets/images/$carType.png',
          carType: carType,
          carBrand: 'Toyota',
          carModel: 'Avalon Trim',
          carPrice: 1500,
          imageWidth: 340,
          imageHeight: 120,
          carStatus: Colors.red,
        ),
      ),
      const SizedBox(height: 16),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: _buildCarTypeCard(
          context,
          imagePath: 'assets/images/$carType.png',
          carType: carType,
          carBrand: 'Toyota',
          carModel: 'Avalon Trim',
          carPrice: 1500,
          imageWidth: 340,
          imageHeight: 120,
          carStatus: Colors.green,
        ),
      ),
      const SizedBox(height: 16),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191919),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          elevation: 0.0,
          backgroundColor: const Color(0xFF191919),
          flexibleSpace: const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
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
                showModalBottomSheet( //dashboard ก็อปตัวนี้ได้เลย
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
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
        child: Container(
          color: Colors.white,
          child: ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 24.0, left: 32.0, right: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Choose your $carType car',
                        style: const TextStyle(
                          fontSize: 24,
                          color: Color(0xFF191919),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_box_outlined),
                      color: Color(0xFF191919),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ...buildCarList(context, carType),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCarTypeCard(
    BuildContext context, {
    required String imagePath,
    required String carType,
    required String carModel,
    required int carPrice,
    required String carBrand,
    required double imageWidth,
    required double imageHeight,
    required Color carStatus,
  }) {
    return GestureDetector(
      onTap: () {
        _handleCarSelectTap(context, carType);
      },
      child: Container(
        height: 235, // Adjust height as needed
        decoration: BoxDecoration(
          color: const Color(0xFFE8E8F2),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: 350,
                child: Row(
                  children: [
                    Icon(Icons.circle, size: 12, color: carStatus),
                    const SizedBox(width: 5),
                    Text(
                      carBrand,
                      style: const TextStyle(
                        color: Color(0xFF191919),
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "THB $carPrice",
                      style: const TextStyle(
                        color: Color(0xFF191919),
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: 350,
                child: Row(
                  children: [
                    Text(
                      carModel, // Display the car model here
                      style: const TextStyle(
                        color: Color.fromARGB(255, 163, 163, 163),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      "day",
                      style: TextStyle(
                        color: Color.fromARGB(255, 163, 163, 163),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: imageWidth,
                height: imageHeight,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    // Handle edit action
                  },
                  icon: const Icon(Icons.mode_edit_outlined),
                  color: Color(0xFF191919),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _handleCarSelectTap(BuildContext context, String carName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Adminrequestborrowcaredit(),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('You selected $carName'),
      ),
    );
  }
}

class DashboardWidget extends StatelessWidget { //dashboard ก็อปตัวนี้ได้เลย
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
