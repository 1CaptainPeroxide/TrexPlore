import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
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
              
              height: 100,
              child: Center(
                
                child: AlertDialog(
                 
                  backgroundColor: const Color.fromARGB(255, 252, 241, 223),
                  icon: Image.asset(
                'lib/icons/sedcat.png',
                height: 100,
              ),
                  
                  content: Text(
                    "Pliss don't go !", textAlign: TextAlign.center,
                    style: GoogleFonts.aBeeZee(
                      fontSize: 20,
                    ),
                  ),
                   actions: <Widget>[
              TextButton(
                child: const Text('B Y E', style: TextStyle(color: Color.fromARGB(255, 255, 66, 123))),
                onPressed: () {
                   final _auth = AuthService();
                  _auth.signOut();
                  Navigator.of(context).pop();
                },
              ),

               TextButton(
                child: const Text('O M K', style: TextStyle(color: Color.fromARGB(255, 255, 66, 123))),
                onPressed: () {
                   
                  Navigator.of(context).pop();
                },
              ),
              ]
                ),
              ),
            );
          });

  


  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Color.fromARGB(255, 252, 241, 223),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //icon
              DrawerHeader(
                curve: Easing.legacy,
                child: Image.asset(
                  'lib/icons/communications.png',
          
                ),
                
              ),
          
              Text("Let'us do some chipi chipi",
                      style: GoogleFonts.aBeeZee(
                        fontSize: 15,
                      )),
          
              SizedBox(
                height: 70,
              ),
          
              ListTile(
                title:  Text('H O M E',
                      style: GoogleFonts.aBeeZee(
                       
                      )),
                leading: Image.asset(
                  'lib/icons/home.png',
                ),
                onTap: () {},
              ),
          
              Divider(color: Colors.black,
              indent: 10,
              endIndent: 10,
              thickness: 0.4,
            ),
          
              SizedBox(
                height: 15,
              ),
          
              ListTile(
                title:  Text('S E T T I N G S',
                      style: GoogleFonts.aBeeZee(
                        
                      )),
                leading: Image.asset(
                  'lib/icons/settings.png',
                ),
                onTap: () {},
              ),
          
              Divider(color: Colors.black,
              indent: 10,
              endIndent: 10,
              thickness: 0.5,
              
            ),
          
             SizedBox(
                height: 60,
              ),
              
             Container(
              decoration: BoxDecoration(color: Color.fromARGB(255, 207, 63, 111),
              border: Border.all(width: 2),
              ),
               child: ListTile(
                    title:  Text('Signed in as: ' + user.email!,
                          style: GoogleFonts.notoSansAdlam(
                            fontSize: 23,
                          )),
                    leading: Image.asset(
                      'lib/icons/mecat.png',
                    ),
                    // onTap: () => logout(context),
                  ),
             ),
          
              // Text('signed in as: ' + user.email!),
          
               SizedBox(
                height: 30,
              ),
          
              GestureDetector(
                onTap: () => logout ,
                child: ListTile(
                  title:  Text('L O G O U T',
                        style: GoogleFonts.notoSansLaoLooped(
                          fontSize: 15,
                        )),
                  leading: Image.asset(
                    'lib/icons/back.png',
                  ),
                  onTap: () => logout(context),
                ),
              ),
          
              Divider(color: Colors.black,
              indent: 10,
              endIndent: 10,
              thickness: 0.5,
            ),
          
             ListTile(
                title:  Text('C O N T A C T  U S',
                      style: GoogleFonts.notoSansLaoLooped(
                        fontSize: 15,
                      )),
                leading: Image.asset(
                  'lib/icons/contactus.png',
                ),
                onTap: () {},
              ),
          
              Divider(color: Colors.black,
              indent: 10,
              endIndent: 10,
              thickness: 0.4,
            ),
            ],
          ),
        ));
  }
}
