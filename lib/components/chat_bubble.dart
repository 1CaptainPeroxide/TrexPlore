import "package:flutter/material.dart";

class ChatBubble extends StatelessWidget {

  final String message;
  final bool isCurrentUser;

  const ChatBubble({super.key, required this.message, required this.isCurrentUser,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      
      child: Container(
        decoration: BoxDecoration(
          color: isCurrentUser ? Color.fromARGB(255, 59, 170, 218) : Color.fromARGB(255, 22, 191, 42),
          borderRadius: BorderRadius.circular(12),
        ),
      
        padding: const EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        child:  Text(message,
        style: TextStyle(color: Colors.white,),),
      ),
    );
  }
}