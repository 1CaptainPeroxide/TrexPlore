import 'package:flutter/material.dart';
import 'package:meowchat/pages/login_page.dart';
import 'package:meowchat/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({Key? key}) : super(key: key);

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;
  bool isLoading = false;

  void togglePages() {
    setState(() {
      isLoading = true; // Show loading indicator
    });

    // Simulate asynchronous operation (e.g., API call, data loading)
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        showLoginPage = !showLoginPage;
        isLoading = false; // Hide loading indicator
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isLoading) {
      // Show loading screen
      child = Center(
        child: CircularProgressIndicator(
          color: Colors.pink,
          backgroundColor: Color.fromARGB(255, 83, 228, 228),
        ), // You can customize the loading indicator
      );
    } else {
      // Show login or register page based on showLoginPage
      child = showLoginPage
          ? LoginPage(
              onTap: togglePages,
            )
          : RegisterPage(
              onTap: togglePages,
            );
    }

    return Scaffold(
      
      body: child,
    );
  }
}
