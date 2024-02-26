import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:meowchat/services/auth/auth_service.dart';

class RegisterPage extends StatelessWidget {

  //controllers
  final TextEditingController _emailcontroller = TextEditingController();

    final TextEditingController _pwcontroller = TextEditingController();
        final TextEditingController _confirmPwcontroller = TextEditingController();

        //tap to toggle
        final void Function()? onTap;




   RegisterPage({super.key, required this.onTap,});

   void register(BuildContext context) {
      final _auth = AuthService();

      if(_pwcontroller.text == _confirmPwcontroller.text) {

        _auth.signUpWithEmailPassword(_emailcontroller.text, _pwcontroller.text);

      }

      else {
         showDialog(context: context, builder: (context) => const AlertDialog(
              title: Text("Passwords dont match"),
        ));
      }


   }

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      backgroundColor: Color.fromARGB(255, 252, 241, 223),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                        height: 150,
                        // padding: EdgeInsets.all(20),
                        child: Image.asset(
                          'lib/icons/black-cat.png'
                        ),
                      ),
                ),
              ), //
          
               SizedBox(height: 5,),
          
               //Hello again!
                  Text('Hello There, Welcome to MeowChat',
                      style: GoogleFonts.badScript(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      )),
          
                      SizedBox(height: 5),
              
                  Text('Register Below!',
                      style: GoogleFonts.badScript(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      )),
          
             //welcome
              
          
              SizedBox(height: 5,),
              //email tf
               Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border:
                            Border.all(color: Color.fromARGB(255, 96, 246, 246)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: TextField(
          
                          controller: _emailcontroller,
                         
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email', 
                          ),
                        ),
                      ),
                    ),
                  ),
             
          
             
          
              //pw tf
          
              SizedBox(height: 10),
          
                  // password textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border:
                            Border.all(color: Color.fromARGB(255, 96, 246, 246)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      // ignore: prefer_const_constructors
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          obscureText: true,
          
                          controller: _pwcontroller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                          ),
                        ),
                      ),
                    ),
                  ),
          
                   SizedBox(height: 10),
          
                  // password textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border:
                            Border.all(color: Color.fromARGB(255, 96, 246, 246)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      // ignore: prefer_const_constructors
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          obscureText: true,
          
                          controller: _confirmPwcontroller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Confirm Password',
                          ),
                          
                        ),
                      ),
                      
                    ),
                  ),
          
                  SizedBox(height: 20,),
          
          
              //login button
          
               //sign in button
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
          
          
              //register now
              SizedBox(height: 25,),
          
              
          
                  // not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?',
                         style: GoogleFonts.badScript(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                                             )),
                      GestureDetector(
                        onTap: onTap,
                        child: Text(
                          ' Login Now',
                          style: GoogleFonts.badScript(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.pink
                                             ),
                        ),
                      ),
                    ],
                  ),
              
            ],
          ),
        ),
      )
    );
  }
}