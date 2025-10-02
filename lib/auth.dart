import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'switch.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  bool auth(String value) {
    return false;
  }

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  String? wError;
  bool darkMode = false;

  bool auth(String value) {
    if (passController.text == 'Vtoan746@') {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    // THEME
    final Color bg = darkMode ? const Color(0xFF0E0F12) : Colors.white;
    final Color drawerBg = darkMode
        ? const Color.fromARGB(255, 52, 55, 62)
        : Colors.white;
    final Color cardBg = darkMode
        ? const Color.fromARGB(255, 35, 37, 40)
        : CupertinoColors.white;
    final Color textColor = darkMode
        ? Colors.white
        : const Color.fromARGB(255, 17, 16, 16);
    final Color subText = darkMode ? Colors.white70 : Colors.grey[700]!;
    final Color borderColor = darkMode
        ? Colors.white24
        : CupertinoColors.black.withOpacity(0.4);
    final Color button = Colors.deepPurpleAccent;

    return Scaffold(
      backgroundColor: (bg),
      endDrawer: Drawer(
        backgroundColor: drawerBg,
        child: ListView(
          children: [
            SizedBox(height: 20),
            DrawerHeader(
              margin: EdgeInsets.only(bottom: 4),
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.settings,
                  size: 40,
                  color: textColor,
                ),
                title: Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: '.SF Pro Display',
                    color: textColor,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: SizedBox(
                child: Icon(
                  CupertinoIcons.person,
                  size: 25,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              title: Text(
                "Manage accounts",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
            ),
            CupertinoListTile(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              leading: SizedBox(
                child: Icon(
                  CupertinoIcons.brightness,
                  size: 25,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              title: Text(
                "Dark mode",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
              trailing: GifSwitchCupertino(
                value: darkMode,
                onChanged: (bool val) {
                  setState(() {
                    darkMode = val;
                  });
                },
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        backgroundColor: bg,
        toolbarHeight: 70.0,
        titleSpacing: 34.0,
        centerTitle: false,
        title: Text(
          'Efep',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontSize: 50,
            fontFamily: 'Knewave',
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          Builder(
            builder: (ctx) => Padding(
              padding: EdgeInsets.only(right: 14.0),
              child: CupertinoButton(
                child: Icon(CupertinoIcons.settings, size: 35, color: subText),
                onPressed: () => Scaffold.of(ctx).openEndDrawer(),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 100),
          ClipOval(
            child: Image.asset(
              'assets/avatar.gif',
              height: 156,
              width: 156,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: SizedBox(
              width: 370,
              child: CupertinoTextField(
                controller: userController,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                placeholder: "Username...",
                style: TextStyle(color: textColor),
                placeholderStyle: TextStyle(color: subText),
                textInputAction: TextInputAction.next,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                  color: cardBg,
                  borderRadius: BorderRadius.circular(90),
                  border: Border.all(color: borderColor, width: 0.4),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: SizedBox(
              width: 370,
              child: CupertinoTextField(
                controller: passController,
                obscureText: true,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                placeholder: "Password...",
                placeholderStyle: TextStyle(color: subText),
                style: TextStyle(color: textColor),
                textInputAction: TextInputAction.next,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                  color: cardBg,
                  borderRadius: BorderRadius.circular(90),
                  border: Border.all(color: borderColor, width: 0.4),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: SizedBox(
              width: 200,
              child: CupertinoButton(
                borderRadius: BorderRadius.circular(90),
                color: button,
                child: Text("Login", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  setState(() {
                    if (!auth(passController.text)) {
                      wError = "Wrong username or password!";
                    } else if (userController.text.isEmpty ||
                        passController.text.isEmpty) {
                      wError = null;
                    } else {
                      wError = null;
                    }
                  });
                },
              ),
            ),
          ),
          SizedBox(height: 23),
          if (wError != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(wError!, style: TextStyle(color: textColor)),
            ),
          SizedBox(height: 120),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: CupertinoButton(
              child: Text(
                "Forgot password?",
                style: TextStyle(color: Colors.grey),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
