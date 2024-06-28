

import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:meowchat/components/chat_bubble.dart";
import "package:meowchat/services/auth/auth_service.dart";
import "package:meowchat/services/chat/chat_service.dart";

class ChatPage extends StatefulWidget {
  final String receiverEmail;
  final String receiverID;
   ChatPage({
    super.key,
    required this.receiverEmail,
    required this.receiverID,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  //text controller 
  final TextEditingController _messageController = TextEditingController();

  //chat and auth services
  final ChatService _chatService = ChatService();

    final AuthService _authService = AuthService();

    FocusNode myFocusNode = FocusNode();

    @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //add listener
    myFocusNode.addListener(() {
      if(myFocusNode.hasFocus) {
            Future.delayed(const Duration(milliseconds: 500), () => scrollDown());
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    myFocusNode.dispose();
    _messageController.dispose();
    super.dispose();
  }

  //scroll controller
  final ScrollController _scrollcontroller = ScrollController();

  void scrollDown() {
    _scrollcontroller.animateTo(_scrollcontroller.position.maxScrollExtent, 
    duration: const Duration(milliseconds: 200), curve: Curves.fastOutSlowIn,);
  }

//send message 
void sendMessage() async {
  if(_messageController.text.isNotEmpty) {
    //send the message
    await _chatService.sendMessage(widget.receiverID, _messageController.text);

    //clear the controller
    _messageController.clear();
  }
}

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("lib/icons/chatbg.png"),
        fit: BoxFit.cover,),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 19,
          title: Container(
            decoration: BoxDecoration(
              
              borderRadius: BorderRadius.all(Radius.circular(9))),
            padding: EdgeInsets.all(27),
            
            child: Text(widget.receiverEmail,
             style: GoogleFonts.robotoSlab(
              fontWeight: FontWeight.bold,
              
              
            ),

            ),
          ),
        ),
      
        body: Column(children: [
          Expanded(child: 
          _buildMessageList(),
      
          ),
          _buildUserInput(),
        ]),
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(stream: _chatService.getMessages(widget.receiverID, senderID), 
    builder: (context, snapshot) {

        //errors
        if(snapshot.hasError) {
          return const Text("Error");
        }

        if(snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading..");
        }

        //return list view
        return ListView(
          controller: _scrollcontroller,
            children: 
              snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
            
        );
    },);
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
      Map<String, dynamic> data  = doc.data() as Map<String, dynamic>;

      // is currrent user
      bool isCurrentUser = data['senderID'] == _authService.getCurrentUser()!.uid;

      var alignment = isCurrentUser ? Alignment.centerRight :Alignment.centerLeft;

      return Container(
        alignment: alignment,
        child: Column(
          crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            ChatBubble(message: data["message"], isCurrentUser: isCurrentUser, )
          ],
        ));
  }

  Widget _buildUserInput() {
    return Padding(
      
      padding: const EdgeInsets.only(bottom: 44.0),
      child: Row(
        children: [
            Expanded(
              child:
      
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
                          obscureText: false,
      
                          controller: _messageController,
                          focusNode: myFocusNode,
                         
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Type a Message',
                            
                          ),
                        ),
                      ),
                    ),
                  ),
            ),
      
            //send button
            Container(
              
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              margin: const EdgeInsets.only(right: 25,),
              child: IconButton(onPressed: sendMessage, icon: Icon(Icons.arrow_upward),
              color: Colors.white,
               padding: EdgeInsets.only(left: 0),)),
        ],
      ),
    );
  }
}