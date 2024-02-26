// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:meowchat/services/auth/auth_service.dart';

class LoginPage extends StatelessWidget {

  //controllers
  final TextEditingController _emailcontroller = new TextEditingController();

    final TextEditingController _pwcontroller = new TextEditingController();

    //tap to go to reg page
    final void Function()? onTap;


   LoginPage({super.key, required this.onTap,});

   void login(BuildContext context) async {
      //get auth
      final authService = AuthService();

      //try login
      try {
      await authService.signInWithEmailPassword(_emailcontroller.text, _pwcontroller.text,);
      } 

      catch (e) {
        showDialog(context: context, builder: (context) => AlertDialog(
              title: Text(e.toString()),
        ));


      }
   }



  @override
  Widget build(BuildContext context) {
    return  Scaffold
    (
      backgroundColor: Color.fromARGB(255, 252, 241, 223),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                  height: 175,
                  padding: EdgeInsets.all(20),
                  child: Image.asset('lib/icons/cat.png'),
                ), // Ic
              //logo
              
          
               SizedBox(height: 10,),

          
             //welcome
              Text('Hello Again',
                    style: GoogleFonts.badScript(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )),

                 SizedBox(height: 10,),
                     Center(
                       child: Text("Welcome back you've been missed",
                                           style: GoogleFonts.badScript(
                                            fontWeight: FontWeight.bold,
                        fontSize: 22,
                                           )),
                     ),
          
              SizedBox(height: 10,),
          
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
              SizedBox(height: 12,),
          
              //login button
          
               //sign in button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: GestureDetector(
                      onTap: () => login(context),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 236, 75, 129),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'Sign In',
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
          
              SizedBox(height: 25),
          
                  // not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Not a member ?',
                    style: GoogleFonts.badScript(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),

                    
                      GestureDetector(
                        //ontap
                        onTap: onTap,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text('Register Now',
                                              style: GoogleFonts.badScript(
                                                fontSize: 18,
                                                color: Colors.pink,
                                                fontWeight: FontWeight.bold
                                              )),
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