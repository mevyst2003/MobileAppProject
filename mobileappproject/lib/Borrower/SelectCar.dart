import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobileappproject/Borrower/History.dart';
import 'package:mobileappproject/login.dart';
import 'package:mobileappproject/Borrower/RequestBorrowCar.dart'; // Import your Requestborrowcar class

class Selectcar extends StatelessWidget {
  final String carType;

  const Selectcar({super.key, required this.carType});

  void _showLogoutDialog(BuildContext context) {
    // ... (Your existing logout dialog code)
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> getCar(carType) {
      List<Widget> car = [];
      car = [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: _buildCarTypeCard(
            context,
            imagePath: 'assets/images/$carType.png',
            carType: '$carType',
            carBrand: 'CarBrand',
            carModel: 'Carmodel',
            carPrice: 1500,
            imageWidth: 340,
            imageHeight: 150,
            carStatus: Colors.red,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: _buildCarTypeCard(
            context,
            imagePath: 'assets/images/$carType.png',
            carType: '$carType',
            carBrand: 'CarBrand',
            carModel: 'Carmodel',
            carPrice: 1500,
            imageWidth: 340,
            imageHeight: 150,
            carStatus: Colors.green,
          ),
        ),
        const SizedBox(height: 16),
      ];
      return car;
    }

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
              Navigator.pop(context);
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
                child: Text(
                  'Choose your $carType car',
                  style: const TextStyle(
                    fontSize: 24,
                    color: Color(0xFF191919),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ...getCar(carType),
            ],
          ),
        ),
      ),
    );
  }
}

// Helper method to build car type cards
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
      height: 240,
      decoration: BoxDecoration(
        color: const Color(0xFFE8E8F2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
              width: 370,
              child: Row(
                children: [
                  Icon(Icons.circle, size: 15, color: carStatus),
                  Text(
                    carBrand,
                    style: const TextStyle(
                      color: Color(0xFF191919),
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "$carPrice",
                    style: const TextStyle(
                      color: Color(0xFF191919),
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Center(
            child: SizedBox(
              width: 370,
              child: Row(
                children: [
                  Text(
                    "car model",
                    style: TextStyle(
                      color: Color.fromARGB(255, 163, 163, 163),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "day",
                    style: TextStyle(
                      color: Color.fromARGB(255, 163, 163, 163),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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
          const SizedBox(height: 10),
        ],
      ),
    ),
  );
}

// Method to handle what happens when a car type card is tapped
void _handleCarSelectTap(BuildContext context, String carName) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) =>
          const Requestborrowcar(), // Updated to navigate to Requestborrowcar
    ),
  );

  // Show message when a car type is selected
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('You selected $carName'),
    ),
  );
}
