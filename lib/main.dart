import 'package:efep_chat/Features/ui/chat/chat_screen.dart';
import 'package:flutter/material.dart';
//import 'Features/ui/chat/chat_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Efep',
      home: ChatScreen(),
    );
  }
}
