import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trexplore/services/auth/auth_service.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();
  final void Function()? onTap;

  RegisterPage({Key? key, required this.onTap}) : super(key: key);

  void register(BuildContext context) {
    final _auth = AuthService();

    String email = _emailController.text.trim();
    String password = _pwController.text.trim();
    String confirmPassword = _confirmPwController.text.trim();

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      // Handle case where any field is empty
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Center(
            child: Text(
              "Please fill in all fields",
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
        ),
      );
      return;
    }

    if (password != confirmPassword) {
      // Handle case where passwords don't match
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Passwords don't match"),
        ),
      );
      return;
    }

    // All validations passed, proceed with sign-up
    _auth.signUpWithEmailPassword(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 232, 104, 125), // Pink color
              const Color.fromARGB(255, 255, 255, 255)!, // Grey-white color
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SafeArea(
                  child: Container(
                    height: 150,
                    child: Image.asset('lib/icons/dest.png'),
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  'Welcome to TrexPlore',
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Register Below!',
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Color.fromARGB(255, 105, 102, 102)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Color.fromARGB(255, 105, 102, 102)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        obscureText: true,
                        controller: _pwController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Color.fromARGB(255, 105, 102, 102)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        obscureText: true,
                        controller: _confirmPwController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Confirm Password',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () => register(context),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 236, 75, 129),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 22),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    GestureDetector(
                      onTap: onTap,
                      child: Text(
                        ' Login Now',
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.pink,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
