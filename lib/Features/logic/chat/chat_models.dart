import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class Message {
  final String text;
  final DateTime sendtime = DateTime.now();
  Message(this.text);
}

final messagesProvider =
    StateNotifierProvider.family<MessageNotifier, List<Message>, String>(
      (ref, chatId) => MessageNotifier(),
    );

class MessageNotifier extends StateNotifier<List<Message>> {
  MessageNotifier() : super(const []);
  void addMessage(Message m) {
    state = [m, ...state];
  }
}
