import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:efep_chat/Features/ui/widget/theme.dart';

// dark mode switch (update bool value)
final darkProvider = StateProvider<bool>((ref) => false);

// theme (set dark mode or light mode)
final themeChange = Provider<AppTheme>((ref) {
  final dark = ref.watch(darkProvider);
  return dark ? AppTheme.dark() : AppTheme.light();
});

//auth -> show message 'Wrong pass'
final wpass = StateProvider.autoDispose<String?>((ref) => null);

//label 'dark mode' & 'light mode'
final mode = Provider<String>((ref) {
  return ref.watch(darkProvider) ? "Light mode" : "Dark mode";
});

//bar type message
final typing = StateProvider<bool>((ref) => false);

//message processing
final messages = StateProvider.family<List<String>, String>(
  (ref, chatId) => [],
);
