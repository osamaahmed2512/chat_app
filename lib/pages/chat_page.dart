import 'package:chat_app_last/constans.dart';
import 'package:chat_app_last/models/messagem_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/chat_bubble.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  static String id = 'chatpage';

  final CollectionReference messages =
      FirebaseFirestore.instance.collection(kmessagecollection);
  final TextEditingController controller = TextEditingController();
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
  var  email=  ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kcreatedat,descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('loading');
        }

        List<Message> messagelist = [];
        for (int i = 0; i < snapshot.data!.docs.length; i++) {
          messagelist.add(Message.fromjson(snapshot.data!.docs[i]));
        }
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: KPrimaryColour,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/scholar.png',
                  height: 50,
                ),
                Text("scholar chat"),
              ],
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  controller: _controller,
                  itemCount: messagelist.length,
                  itemBuilder: (context, index) {
                    return messagelist[index].id == email? ChatBubble(
                      message: messagelist[index],
                    ):ChatBubbleforfriend(message: messagelist[index]);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  controller: controller,
                  onSubmitted: (data) {
                    messages.add({
                      'message': data,
                      kcreatedat: new DateTime.now(),
                      'id':email
                    });
                    controller.clear();
                    _controller.animateTo(
                      // _controller.position.maxScrollExtent,
                      0,
                      duration: Duration(seconds: 1),
                      curve: Curves.fastOutSlowIn,
                    );
                  },
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.send),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: KPrimaryColour),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
