import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meowchat/pages/home_page.dart';
import 'package:meowchat/pages/main_page.dart';
import 'package:meowchat/pages/map_page.dart';
import 'package:meowchat/services/auth/auth_service.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final user = FirebaseAuth.instance.currentUser!;

  void logout(BuildContext context) {
    final _auth = AuthService();
    _auth.signOut;

    showDialog(
      context: context,
      builder: (context) {
        return Container(
          height: 150,
          child: Center(
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              content: Text(
                "Are you sure to logout?",
                textAlign: TextAlign.center,
                style: GoogleFonts.raleway(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: const Text(
                      'YES',
                      style: TextStyle(color: Colors.black),
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 222, 53, 109),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    final _auth = AuthService();
                    _auth.signOut();
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: const Text(
                      'NO',
                      style: TextStyle(color: Colors.black),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 232, 107, 148), // Pink
              
              
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DrawerHeader(
                child: Image.asset(
                  'lib/icons/destination.png',
                ),
              ),
              SizedBox(height: 15),
              Text(
                "TREXPLORE",
                style: GoogleFonts.aBeeZee(
                  fontSize: 33,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50),
              ListTile(
                title: Text(
                  'Home',
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
                leading: Image.asset(
                  'lib/icons/homeadd.png',
                  height: 50,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                },
              ),
              Divider(
                color: Colors.black,
                thickness: 0.9,
              ),
              SizedBox(height: 15),
              ListTile(
                title: Text(
                  'Trexplore Map',
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
                leading: Image.asset(
                  'lib/icons/map.png',
                  height: 50,
                ),
                onTap: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapPage()),
                  );
                },
              ),
              Divider(
                color: Colors.black,
                thickness: 0.9,
              ),
              SizedBox(height: 15),
              ListTile(
                title: Text(
                  'Chats',
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
                leading: Image.asset(
                  'lib/icons/speak.png',
                  height: 50,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
              Divider(
                color: Colors.black,
                thickness: 0.9,
              ),
              SizedBox(height: 15),
              ListTile(
                title: Text(
                  'Profile',
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
                leading: Image.asset(
                  'lib/icons/user.png',
                  height: 50,
                ),
                onTap: () {},
              ),
              Divider(
                color: Colors.black,
                thickness: 0.9,
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () => logout,
                child: ListTile(
                  title: Text(
                    'LogOut',
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                    ),
                  ),
                  leading: Image.asset(
                    'lib/icons/logout.png',
                    height: 50,
                  ),
                  onTap: () => logout(context),
                ),
              ),
              Divider(
                color: Colors.black,
                thickness: 0.9,
              ),
              SizedBox(height: 15),
              ListTile(
                title: Text(
                  'Contact us',
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
                leading: Image.asset(
                  'lib/icons/contact.png',
                  height: 50,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
