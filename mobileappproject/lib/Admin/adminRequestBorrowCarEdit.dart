import 'package:flutter/material.dart';
import 'package:mobileappproject/Admin/adminAssetlist.dart';
import 'package:mobileappproject/Admin/adminHistory.dart';
import 'package:mobileappproject/Admin/returnStatus.dart';
import 'package:mobileappproject/login.dart';

class Adminrequestborrowcaredit extends StatefulWidget {
  const Adminrequestborrowcaredit({super.key});

  @override
  State<Adminrequestborrowcaredit> createState() =>
      _AdminrequestborrowcareditState();
}

class _AdminrequestborrowcareditState extends State<Adminrequestborrowcaredit> {
  bool isEditingTopBox = false;
  bool isEditingFeatures = false;
  bool isEditingDescription = false;
  String _status = "Available";

  // Text controllers for each editable field
  final TextEditingController _nameController =
      TextEditingController(text: "BMW 750e xDrive");
  final TextEditingController _priceController =
      TextEditingController(text: "3500");
  final TextEditingController _seatController =
      TextEditingController(text: "5 seats");
  final TextEditingController _featuresController =
      TextEditingController(text: "Two-zone");
  final TextEditingController _features2Controller =
      TextEditingController(text: "4.2s 0-100km/h");
  final TextEditingController _descriptionController = TextEditingController(
      text:
          " Luxury plug-in hybrid sedan featuring a 3.0-liter inline-six turbocharged engine paired with an electric motor, delivering a combined output of 490 horsepower and 700 Nm of torque. It offers xDrive all-wheel drive, an electric-only range of 50-60 km, and a 0-100 km/h time of 4.8 seconds. Equipped with an 8-speed automatic transmission, adaptive air suspension, and advanced hybrid technology, it provides a smooth, powerful, and efficient driving experience.");

  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _seatController.dispose();
    _featuresController.dispose();
    _features2Controller.dispose();
    _descriptionController;
    super.dispose();
  }

  void toggleEditMode(String field) {
    setState(() {
      switch (field) {
        case "topbox":
          isEditingTopBox = !isEditingTopBox;
          break;
        case "features":
          isEditingFeatures = !isEditingFeatures;
          break;
        case "description":
          isEditingDescription = !isEditingDescription;
          break;
      }
    });
  }

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
        // พื้นหลังภาพ
        children: [
          // แถบด้านบน (AppBar)
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
              // ส่วนเนื้อหาหลัก
              Expanded(
                child: Container(
                  // ภาพพื้นหลังของส่วนเนื้อหา
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
                        margin: const EdgeInsets.only(top: 120.0),
                        height: 1100,
                        decoration: const BoxDecoration(
                          color: Color(0xFF191919),
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(50)),
                        ),
                        padding: const EdgeInsets.only(left: 16.0, top: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ข้อมูลรถ
                            Row(
                              children: [
                                isEditingTopBox 
                                    ? Expanded(
                                        child: TextField( // textfield หลังจากกด ปุ่มแก้ไข
                                          controller: _nameController,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          decoration: const InputDecoration(
                                            border: UnderlineInputBorder(),
                                          ),
                                        ),
                                      )
                                    : Text(
                                        _nameController.text,
                                        style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                IconButton(
                                  onPressed: () => toggleEditMode("topbox"),
                                  icon: const Icon(
                                    Icons.mode_edit_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 1),
                            isEditingTopBox
                                ? Container( // textfield หลังจากกด ปุ่มแก้ไข
                                    height: 30,
                                    width: 60, // Adjust width as needed
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    decoration: const BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border(
                                        bottom: BorderSide(
                                            color: Colors.white, width: 1.0),
                                      ),
                                    ),
                                    child: TextField(
                                      controller: _priceController,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      decoration: const InputDecoration(
                                        border: InputBorder
                                            .none, // Remove default underline
                                      ),
                                    ),
                                  )
                                : Row(
                                    children: [
                                      const Text(
                                        "THB ",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        _priceController.text,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const Text(
                                        " day",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                            // สถานะการใช้งาน
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    isEditingTopBox
                                        ? DropdownButton<String>( // DropdownButton หลังจากกด ปุ่มแก้ไข
                                            value: _status,
                                            dropdownColor: Colors
                                                .black, // Optional: set background for dropdown
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                            icon: const Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.white,
                                            ),
                                            items: <String>[
                                              'Available',
                                              'Disable'
                                            ].map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                _status = newValue!;
                                              });
                                            },
                                          )
                                        : Text(
                                            _status,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                    const SizedBox(height: 1),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.people,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                        const SizedBox(width: 5),
                                        isEditingTopBox 
                                            ? Container( // textfield หลังจากกด ปุ่มแก้ไข
                                                height: 40,
                                                width: 70,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                decoration: const BoxDecoration(
                                                  color: Colors.transparent,
                                                  border: Border(
                                                    bottom: BorderSide(
                                                        color: Colors.white,
                                                        width: 1.0),
                                                  ),
                                                ),
                                                child: TextField(
                                                  controller: _seatController,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  decoration:
                                                      const InputDecoration(
                                                    border: InputBorder
                                                        .none, // Remove default underline
                                                  ),
                                                ),
                                              )
                                            : Text(
                                                _seatController.text,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                ),
                                              ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 20),
                                // รูปรถ
                                Container(
                                  width: 300,
                                  height: 140,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/BMW.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // รายละเอียดฟีเจอร์
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 850,
                              decoration: const BoxDecoration(
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
                                    // ชื่อฟีเจอร์
                                    Row(
                                      children: [
                                        const Text(
                                          'Features',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () =>
                                                toggleEditMode("features"),
                                            icon: const Icon(
                                                Icons.mode_edit_outlined)),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.all(16),
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
                                                const Icon(
                                                  Icons.ac_unit_outlined,
                                                  color: Colors.black,
                                                  size: 24,
                                                ),
                                                const SizedBox(height: 10),
                                                const Text(
                                                  'Climate Control',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                isEditingFeatures
                                                    ? Container( // textfield หลังจากกด ปุ่มแก้ไข
                                                        height: 40,
                                                        width: 100,
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    8.0),
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: Colors
                                                              .transparent,
                                                          border: Border(
                                                            bottom: BorderSide(
                                                                color:
                                                                    Colors.grey,
                                                                width: 1.0),
                                                          ),
                                                        ),
                                                        child: TextField(
                                                          controller:
                                                              _featuresController,
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 16,
                                                          ),
                                                          decoration:
                                                              const InputDecoration(
                                                            border: InputBorder
                                                                .none, // Remove default underline
                                                          ),
                                                        ),
                                                      )
                                                    : Text(
                                                        _featuresController
                                                            .text,
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.all(16),
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
                                                const Icon(
                                                  Icons.speed,
                                                  color: Colors.black,
                                                  size: 24,
                                                ),
                                                const SizedBox(height: 10),
                                                const Text(
                                                  'Acceleration',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                isEditingFeatures
                                                    ? Container( // textfield หลังจากกด ปุ่มแก้ไข
                                                        height: 40,
                                                        width: 140,
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    8.0),
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: Colors
                                                              .transparent,
                                                          border: Border(
                                                            bottom: BorderSide(
                                                                color:
                                                                    Colors.grey,
                                                                width: 1.0),
                                                          ),
                                                        ),
                                                        child: TextField(
                                                          controller:
                                                              _features2Controller,
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 16,
                                                          ),
                                                          decoration:
                                                              const InputDecoration(
                                                            border: InputBorder
                                                                .none, // Remove default underline
                                                          ),
                                                        ),
                                                      )
                                                    : Text(
                                                        _features2Controller
                                                            .text,
                                                        style: const TextStyle(
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
                                    const SizedBox(height: 30),
                                    // คำอธิบายรถ
                                    Row(
                                      children: [
                                        const Text(
                                          'Car Description',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () =>
                                                toggleEditMode("description"),
                                            icon: const Icon(
                                                Icons.mode_edit_outlined)),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    // รายละเอียดคำอธิบาย
                                    isEditingDescription
                                        ? Container( 
                                            padding: const EdgeInsets.all(8.0),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.grey,
                                                  width: 1.0),
                                            ),
                                            child: TextField(
                                              controller:
                                                  _descriptionController,
                                              maxLines:
                                                  6, // Adjust based on how large you want the box
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                              ),
                                              decoration: const InputDecoration(
                                                border: InputBorder
                                                    .none, // Remove underline
                                                hintText:
                                                    "Enter car description here",
                                              ),
                                            ),
                                          )
                                        : Text(
                                            _descriptionController.text,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey,
                                            ),
                                          ),

                                    const SizedBox(height: 10),
                                    const Text(
                                      'Date Borrow - Return',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Column(
                                      children: [
                                        // ปุ่มให้เลือกวันที่
                                        OutlinedButton(
                                          onPressed: () {},
                                          style: OutlinedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30, vertical: 15),
                                            side: const BorderSide(
                                                color: Colors.grey),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            minimumSize:
                                                const Size(double.infinity, 50),
                                          ),
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Date Borrow',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Icon(Icons.calendar_today,
                                                  color: Colors.grey),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        OutlinedButton(
                                          onPressed: () {},
                                          style: OutlinedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30, vertical: 15),
                                            side: const BorderSide(
                                                color: Colors.grey),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            minimumSize:
                                                const Size(double.infinity, 50),
                                          ),
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Date Return',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Icon(Icons.calendar_today,
                                                  color: Colors.grey),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        const Divider(
                                          thickness: 1,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  const TextSpan(
                                                    text: 'THB ',
                                                    style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: _priceController.text,
                                                    style: const TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  const TextSpan(
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
                                            // ปุ่มเช่ารถ
                                            ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.black,
                                              ),
                                              child: const Text(
                                                'Save',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
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
                  MaterialPageRoute(builder: (context) => const Adminassetlist()),
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Returnstatus()),
                );
                break;
              case 2:
                //  Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => const Returnstatus()),
                //   );
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
    );
  }

  void _handleCarSelectTap(BuildContext context, String carName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('You selected $carName'),
      ),
    );
  }
}
