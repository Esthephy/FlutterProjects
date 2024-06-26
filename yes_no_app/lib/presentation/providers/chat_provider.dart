import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';

import '../../domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{
  final ScrollController chatScrollController= ScrollController();
  final GetYesNoAnswer getYesNoAnswer=GetYesNoAnswer();
  List<Message> messagesList=[
    Message(text: 'Hi!', fromWho: FromWho.me),
    Message(text: 'Hi honey',fromWho: FromWho.hers),

  ];
  Future<void> sendMessage(String text) async {
    if(text.isEmpty) return;
    final newMessage=Message(text:text,fromWho: FromWho.me);
    messagesList.add(newMessage);

    if(text.endsWith('?')){
      herReply();
    }

    notifyListeners();
    moveScrollBottom();
  }

  Future<void> herReply()async{
    final herMessage=await getYesNoAnswer.getAnswer();
    messagesList.add(herMessage);
    notifyListeners();
    moveScrollBottom();
  }

  Future<void> moveScrollBottom() async{
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent ,
        duration: const Duration(milliseconds: 300),
        curve:Curves.easeOut);
  }
}