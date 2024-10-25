import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobileappproject/Borrower/Cartypelist1.dart';
import 'package:mobileappproject/Borrower/History.dart';
import 'package:mobileappproject/Borrower/RequestBorrowCar.dart';
import 'package:mobileappproject/login.dart';

class Selectcar extends StatelessWidget {
  final String carType;

  const Selectcar({super.key, required this.carType});

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
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
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
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
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
            icon: Icon(Icons.time_to_leave, size: 25),
            label: 'Car list',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Request & History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app),
            label: 'Log out',
          ),
        ],
        selectedLabelStyle: const TextStyle(fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontSize: 13),
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
                padding: const EdgeInsets.only(top: 24.0, left: 32.0, right: 16.0),
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
              const SizedBox(height: 20),
              ...buildCarList(context, carType),
            ],
          ),
        ),
      ),
    );
  }
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
      height: 210, // Adjust height as needed
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
                    "\THB $carPrice",
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
                    style: TextStyle(
                      color: Color.fromARGB(255, 163, 163, 163),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  const Spacer(),
                  Text(
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
        ],
      ),
    ),
  );
}



void _handleCarSelectTap(BuildContext context, String carName) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const Requestborrowcar(),
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('You selected $carName'),
    ),
  );
}
