import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:trexplore/components/user_tile.dart";
import "package:trexplore/pages/chat_page.dart";
import 'package:trexplore/services/auth/auth_service.dart';
import "package:trexplore/components/my_drawer.dart";
import "package:trexplore/services/chat/chat_service.dart";

class HomePage extends StatelessWidget {
   HomePage({super.key});

  //chat and auth services
  final ChatService _chatService = ChatService();
    final AuthService _authService = AuthService();



  void logout() {
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Scaffold(
      
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        
       
      
        
        drawer: MyDrawer(),
        
      
        body: _buildUserList(),
      ),
    );
  }

  //build a list of users loggen in except the current user
  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
       builder: (context, snapshot) {
         
         //error
         if(snapshot.hasError) {
          return const Text('Error');
         }

         // Loading
         if(snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading');
         }

         //return list view
         return ListView(
                children: snapshot.data!.map<Widget>((userData) => _buildUserListItem(userData, context)).toList(),
         );
       },);
  }

  //BUILD INDIVIDUAL LIST ITEM

  Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
    //display all user except current user
    if(userData["email"] != _authService.getCurrentUser()!.email){
      return UserTile(
      text: userData["email"],
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(
          receiverEmail: userData["email"],
          receiverID: userData["uid"],
        ),
        ));
      },
    );
    }

    else {
      return Container();
    }

  }

}