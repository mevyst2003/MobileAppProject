import 'package:flutter/material.dart';
import 'package:mobileappproject/History.dart';
import 'package:mobileappproject/home.dart';

class Cartypelist1 extends StatelessWidget {
  const Cartypelist1({super.key});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Good Luck :)'),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Home()),
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text('Log out'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF191919),
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(100), // Increase the height of AppBar
        child: AppBar(
          elevation: 0.0, // Remove elevation to make it flush with the body
          backgroundColor: Color(0xFF191919),
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 16.0), // Adjust padding to center title properly
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Hertz Rental',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    '.',
                    style: TextStyle(
                      fontSize: 32,
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF191919),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cartypelist1()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => History()),
              );
              break;
            case 2:
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
            icon: Icon(Icons.punch_clock),
            label: 'Request & History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout_rounded),
            label: 'Log out',
          ),
        ],
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
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Car type selection for Sedan
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: _buildCarTypeCard(
                  context,
                  imagePath: 'assets/images/Sedan.png',
                  carType: 'Sedan',
                  imageWidth: 340,
                  imageHeight: 150,
                ),
              ),
              const SizedBox(height: 16),

              // Car type selection for SUV
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: _buildCarTypeCard(
                  context,
                  imagePath: 'assets/images/SUV.png',
                  carType: 'SUV',
                  imageWidth: 340,
                  imageHeight: 150,
                ),
              ),
              const SizedBox(height: 16),

              // Car type selection for Pick-up
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: _buildCarTypeCard(
                  context,
                  imagePath: 'assets/images/Pick-Up.png',
                  carType: 'Pick-up',
                  imageWidth: 340,
                  imageHeight: 150,
                ),
              ),
              const SizedBox(height: 16),

              // Car type selection for EV
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: _buildCarTypeCard(
                  context,
                  imagePath: 'assets/images/EV.png',
                  carType: 'EV',
                  imageWidth: 320,
                  imageHeight: 130,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build car type cards
  Widget _buildCarTypeCard(
    BuildContext context, {
    required String imagePath,
    required String carType,
    required double imageWidth,
    required double imageHeight,
  }) {
    return Container(
      height: 240,
      decoration: BoxDecoration(
        color: const Color(0xFFE8E8F2),
        borderRadius: BorderRadius.circular(20),
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
          const SizedBox(height: 10),
          Text(
            carType,
            style: const TextStyle(
              color: Color(0xFF191919),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
