import 'package:flutter/material.dart';
import 'package:mobileappproject/Borrower/History.dart';
import 'package:mobileappproject/Borrower/Cartypelist1.dart';
import 'package:mobileappproject/login.dart';

class Requestborrowcar extends StatelessWidget {
  const Requestborrowcar({super.key});

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
          content: Container(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/your_image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              PreferredSize(
                preferredSize: const Size.fromHeight(100),
                child: AppBar(
                  elevation: 0.0,
                  flexibleSpace: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Hertz Rental',
                          style: TextStyle(
                            fontSize: 28,
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
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/black.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            top: 120.0), // เพิ่ม margin ด้านบน
                        height: 1100,
                        decoration: BoxDecoration(
                          color: Color(0xFF191919),
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(50)),
                        ),
                        padding: const EdgeInsets.only(left: 16.0, top: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'BMW 750e xDrive',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(height: 1),
                            Text(
                              'THB 3500/Day',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Available',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 1),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.people,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          '5 seats',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(width: 20),
                                Container(
                                  width: 300,
                                  height: 140,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/BMW.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 850,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(50),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Features',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            20), // ระยะห่างระหว่าง 'Features' และกรอบ
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.all(16),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.grey, width: 2),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.ac_unit_outlined,
                                                  color: Colors.black,
                                                  size: 24,
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  'Climate Control',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  'Two-zone',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            width: 20), // ช่องว่างระหว่างกรอบ
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.all(16),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.grey, width: 2),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.speed,
                                                  color: Colors.black,
                                                  size: 24,
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  'Acceleration',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  '4.2s 0-100km/h',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                        height:
                                            30), // ระยะห่างระหว่างกรอบและ Car Description
                                    Text(
                                      'Car Description',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            10), // ระยะห่างระหว่าง Car Description กับเนื้อหา
                                    Text(
                                      '           Luxury plug-in hybrid sedan featuring a 3.0-liter inline-six turbocharged engine paired with an electric motor, delivering a combined output of 490 horsepower and 700 Nm of torque. It offers xDrive all-wheel drive, an electric-only range of 50-60 km, and a 0-100 km/h time of 4.8 seconds. Equipped with an 8-speed automatic transmission, adaptive air suspension, and advanced hybrid technology, it provides a smooth, powerful, and efficient driving experience.',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            30), // ระยะห่างระหว่าง Car Description และ Date Borrow-Return
                                    Text(
                                      'Date Borrow - Return',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 20), // เพิ่มระยะห่าง
                                    Column(
                                      children: [
                                        OutlinedButton(
                                          onPressed: () {
                                            // ทำสิ่งที่คุณต้องการเมื่อคลิก
                                          },
                                          style: OutlinedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30, vertical: 15),
                                            side: const BorderSide(
                                                color:
                                                    Colors.grey), // กรอบสีเทา
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            minimumSize: Size(double.infinity,
                                                50), // ทำให้ปุ่มยาวเต็มบรรทัด
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween, // จัดตำแหน่งให้ห่างกัน
                                            children: [
                                              const Text(
                                                'Date Borrow',
                                                style: TextStyle(
                                                  color: Colors
                                                      .grey, // ตัวอักษรสีเทา
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Icon(Icons.calendar_today,
                                                  color: Colors.grey), // ไอคอน
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            height: 10), // ระยะห่างระหว่างปุ่ม
                                        OutlinedButton(
                                          onPressed: () {
                                            // ทำสิ่งที่คุณต้องการเมื่อคลิก
                                          },
                                          style: OutlinedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30, vertical: 15),
                                            side: const BorderSide(
                                                color:
                                                    Colors.grey), // กรอบสีเทา
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            minimumSize: Size(double.infinity,
                                                50), // ทำให้ปุ่มยาวเต็มบรรทัด
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween, // จัดตำแหน่งให้ห่างกัน
                                            children: [
                                              const Text(
                                                'Date Return',
                                                style: TextStyle(
                                                  color: Colors
                                                      .grey, // ตัวอักษรสีเทา
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Icon(Icons.calendar_today,
                                                  color: Colors.grey),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Divider(
                                          thickness: 1,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: 'THB 3500',
                                                    style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: ' /day',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                // เพิ่มฟังก์ชันการทำงานที่ต้องการเมื่อกดปุ่ม
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors
                                                    .black, // สีพื้นหลังของปุ่ม
                                              ),
                                              child: Text(
                                                'Rent now',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors
                                                      .white, // สีตัวอักษรเป็นสีขาว
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
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
            icon: Icon(Icons.access_time),
            label: 'Request & History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout_rounded),
            label: 'Log out',
          ),
        ],
      ),
    );
  }

  // Method to handle what happens when a car type card is tapped
  void _handleCarSelectTap(BuildContext context, String carName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('You selected $carName'),
      ),
    );
  }
}
