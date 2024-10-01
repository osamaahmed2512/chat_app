
import 'package:chat_app_last/models/messagem_model.dart';
import 'package:flutter/material.dart';

import '../constans.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key, required this.message,
  });
final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(left: 16,bottom:16,right:16,top: 16  ),
        margin: EdgeInsets.symmetric(horizontal: 8 ,vertical: 16),
        decoration: const  BoxDecoration(
          color: KPrimaryColour,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight:  Radius.circular(32),
          ),
        ),
        child: Text(
          message.message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}


class ChatBubbleforfriend extends StatelessWidget {
  const ChatBubbleforfriend({
    super.key, required this.message,
  });
final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(left: 16,bottom:16,right:16,top: 16  ),
        margin: EdgeInsets.symmetric(horizontal: 8 ,vertical: 16),
        decoration: const  BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft:  Radius.circular(32),
          ),
        ),
        child: Text(
          message.message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
