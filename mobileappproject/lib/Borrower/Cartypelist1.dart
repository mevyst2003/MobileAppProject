import 'package:flutter/material.dart';
import 'package:mobileappproject/Borrower/History.dart';
import 'package:mobileappproject/login.dart';

class Cartypelist1 extends StatelessWidget {
  const Cartypelist1({super.key});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Good Luck :)',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 30,
                      ),),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            FilledButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                  const Color.fromARGB(255, 31, 31, 31),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Login()),
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text('Log out'),
            ),
            Container(
              height: 40,
              width: 90,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Cancel',style: TextStyle(color: Colors.black),),
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
                children: [
                  Text(
                    'Hertz Rental',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
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
        backgroundColor: const Color(0xFF191919),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Cartypelist1()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const History()),
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
