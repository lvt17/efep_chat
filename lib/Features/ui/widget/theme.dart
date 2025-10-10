import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  final Color bg;
  final Color cardBg;
  final Color drawerBg;
  final Color textColor;
  final Color subText;
  final Color borderColor;
  final Color button;
  final Color profileCard;

  const AppTheme({
    required this.bg,
    required this.cardBg,
    required this.drawerBg,
    required this.textColor,
    required this.subText,
    required this.borderColor,
    required this.button,
    required this.profileCard,
  });

  factory AppTheme.dark() => const AppTheme(
    bg: Color(0xFF0E0F12),
    cardBg: Color.fromARGB(255, 35, 37, 40),
    drawerBg: Color.fromARGB(255, 52, 55, 62),
    textColor: Colors.white,
    subText: Colors.white70,
    borderColor: Colors.white24,
    button: Colors.deepPurpleAccent,
    profileCard: Colors.white24,
  );

  factory AppTheme.light() => AppTheme(
    bg: Colors.white,
    cardBg: CupertinoColors.white,
    drawerBg: Colors.white,
    textColor: const Color.fromARGB(255, 17, 16, 16),
    subText: Colors.grey[700]!,
    borderColor: CupertinoColors.black.withOpacity(0.4),
    button: Colors.deepPurpleAccent,
    profileCard: const Color.fromARGB(255, 236, 236, 236),
  );
}
