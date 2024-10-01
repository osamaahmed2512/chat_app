import 'package:chat_app_last/constans.dart';

class Message {
  final String message;
  final String id ;
  Message( {required this.id,required this.message});

 factory Message.fromjson(jsondata){
  return Message(message:jsondata[kmessage],id:jsondata['id'] );

 }
}