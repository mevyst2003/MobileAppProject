import 'package:flutter/material.dart';
import 'package:mobileappproject/Admin/adminRequestBorrowCarEdit.dart';
import 'package:mobileappproject/Admin/returnStatus.dart';

class Adminselectcar extends StatefulWidget {
  final String carType;
  const Adminselectcar({super.key, required this.carType});

  @override
  State<Adminselectcar> createState() => _AdminselectcarState();
}

class _AdminselectcarState extends State<Adminselectcar> {
  void _showLogoutDialog(BuildContext context) {
    // ... (Your existing logout dialog code)
  }

  List<Widget> getCar(String carType) {
    return [
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
        type: BottomNavigationBarType.fixed, // Add this line
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
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const Returnstatus()),
              // );
              break;
            case 2:
             Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Returnstatus()),
              );
              break;
            case 3:
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const ()),
              // );
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
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            label: 'Return',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'History',
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
                  child: Row(
                    children: [
                      Text(
                        'Choose your ${widget.carType} car',
                        style: const TextStyle(
                          fontSize: 24,
                          color: Color(0xFF191919),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add_box_outlined)),
                    ],
                  )),
              const SizedBox(height: 10),
              ...getCar(widget.carType),
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
        height: 270,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.mode_edit_outlined))
                  ],
                )
              ],
            )
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
            const Adminrequestborrowcaredit(), // Updated to navigate to Requestborrowcar
      ),
    );

    // Show message when a car type is selected
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('You selected $carName'),
      ),
    );
  }
}
