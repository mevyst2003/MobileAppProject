import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobileappproject/Admin/adminAssetlist.dart';
import 'package:mobileappproject/Borrower/Cartypelist1.dart';
import 'package:mobileappproject/Lender/lenderAssetlist.dart';
import 'package:mobileappproject/home.dart';
import 'package:mobileappproject/register.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login2State();
}

Future<void> fetchData() async {
  final response = await http.get(Uri.parse(
      'http://localhost/phpmyadmin/index.php?route=/database/structure&db=hertzrental'));

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    print(data);
  } else {
    throw Exception('Failed to load data');
  }
}

class _Login2State extends State<Login> {
  final String url = "rnwpd-223-205-197-130.a.free.pinggy.link";
  bool isWaiting = false;

  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool sP = true;
  String? _errorMessage; // Change to String to hold specific error messages

  Future<void> _login(String username, String password) async {
    setState(() {
      _errorMessage = null;
    });

    if (username.isEmpty || password.isEmpty) {
      setState(() {
        _errorMessage = "Please enter both username and password";
      });
      return;
    }

    try {
      Uri uri = Uri.https(url, '/login');

      Map account = {
        'username': username,
        'password': password,
      };

      http.Response response = await http.post(uri, body: account).timeout(
            const Duration(seconds: 10),
          );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        // Use the role to navigate to different pages
        String role = data['role'];
        if (role == 'admin') {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Adminassetlist()));
        } else if (role == 'lender') {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Lenderassetlist()));
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Cartypelist1()));
        }
      } else {
        setState(() {
          _errorMessage = jsonDecode(response.body)['error'];
        });
      }
    } catch (error) {
      setState(() {
        _errorMessage = "An error occurred. Please try again later.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Home(),
              ),
            );
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Text(
                "Welcome back!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 30,
                  height: 1.0,
                  fontFamily: 'Montserrat',
                ),
              ),
              const Text(
                "Login to your account",
                style: TextStyle(
                  color: Color.fromARGB(255, 156, 156, 156),
                  fontSize: 17,
                  height: 2,
                  fontFamily: 'Montserrat',
                ),
              ),
              const SizedBox(height: 45),
              // Login TextField
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.grey.withOpacity(0.4)),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.person_outline_rounded,
                      color: Color.fromARGB(255, 156, 156, 156),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: loginController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Username",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 156, 156, 156),
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 13),

              // Password TextField
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.grey.withOpacity(0.4)),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.lock_outline_rounded,
                      color: Color.fromARGB(255, 156, 156, 156),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: passwordController,
                        obscureText: sP,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          sP = !sP;
                        });
                      },
                      icon: Icon(
                        sP ? Icons.remove_red_eye : Icons.remove_outlined,
                      ),
                    ),
                  ],
                ),
              ),

              // Error Message
              const SizedBox(height: 10.0),
              Center(
                child: _errorMessage != null
                    ? Text(
                        _errorMessage!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                        ),
                      )
                    : const SizedBox(
                        height: 14), // Maintain space when no error
              ),

              const SizedBox(height: 30),

              // Login Button
              SizedBox(
                height: 53,
                width: 400,
                child: FilledButton(
                  onPressed: () {
                    String login = loginController.text.trim();
                    String password = passwordController.text.trim();

                    // Clear previous error message
                    setState(() {
                      _errorMessage = null;
                    });

                    // Validation logic
                    if (login.isEmpty && password.isEmpty) {
                      _errorMessage = "Please enter both username and password";
                    } else if (login.isEmpty) {
                      _errorMessage = "Please enter your username";
                    } else if (password.isEmpty) {
                      _errorMessage = "Please enter your password";
                    } else {
                      _login(login, password);
                    }

                    // Update state to reflect changes
                    setState(() {});
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 31, 31, 31),
                    ),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 90),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Register(),
                        ),
                      );
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(String imagePath) {
    return Container(
      height: 60,
      width: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(30),
      ),
      child: FilledButton(
        onPressed: () {},
        style: FilledButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        ),
        child: SizedBox(
          width: 40,
          height: 50,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
