import 'package:flutter/material.dart';
import 'package:mobileappproject/Borrower/Cartypelist1.dart';
import 'package:mobileappproject/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login2State();
}

class _Login2State extends State<Login> {
  // TextEditingControllers to capture user input
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool sP = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back
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
                        controller: loginController, // Capture login input
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Login",
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
                        controller:
                            passwordController, // Capture password input
                        obscureText: sP, // Hide input
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
                        // Toggle the state of `sP` and update the UI
                        setState(() {
                          sP = !sP;
                        });
                      },
                      icon: Icon(
                        sP
                            ? Icons.remove_red_eye
                            : Icons
                                .remove_outlined, // Toggle between the two icons
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              // Login Button
              SizedBox(
                height: 53,
                width: 400,
                child: FilledButton(
                  onPressed: () {
                    // Retrieve input values
                    String login = loginController.text;
                    String password = passwordController.text;

                    // Basic validation logic
                    if (login.isNotEmpty && password.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const Cartypelist1(), // Navigate to HomePage
                        ),
                      );
                    } else {
                      // Show error message
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text('Please enter both login and password.'),
                        ),
                      );
                    }
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
              const SizedBox(height: 25),

              // OR CONTINUE WITH Section
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "OR CONTINUE WITH",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Social Login Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialButton('assets/images/facebook_logo.png'),
                  const SizedBox(width: 20),
                  _buildSocialButton('assets/images/google_logo.png'),
                  const SizedBox(width: 20),
                  _buildSocialButton('assets/images/apple_logo.png'),
                  
                ],
              ),
              const SizedBox(height: 90),

              // Register Link
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
                          builder: (context) =>
                              const Register(), // Navigate to Register page
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
}

// Helper method to build social login buttons
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
