import 'package:efep_chat/Features/ui/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widget/switchCustom.dart';
import 'get_email.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:efep_chat/core/providers/providers.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  bool auth(String value) {
    return false;
  }

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool auth() {
    if (passController.text == 'Vtoan746@' &&
        userController.text.toLowerCase() == 'lieutoan7788a@gmail.com') {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    //label wrong pass
    final error = ref.watch(wpass);
    // THEME -> dark : light
    final theme = ref.watch(themeChange);
    //---
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: (theme.bg),
        endDrawer: Drawer(
          backgroundColor: theme.drawerBg,
          child: ListView(
            children: [
              SizedBox(height: 20),
              DrawerHeader(
                margin: EdgeInsets.only(bottom: 4),
                child: ListTile(
                  leading: Icon(
                    CupertinoIcons.settings,
                    size: 40,
                    color: theme.textColor,
                  ),
                  title: Text(
                    "Settings",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontFamily: '.SF Pro Display',
                      color: theme.textColor,
                    ),
                  ),
                ),
              ),

              ListTile(
                title: Text(
                  "Accounts",
                  style: TextStyle(fontSize: 15, color: theme.subText),
                ),
              ),

              CupertinoListTile(
                leading: Icon(
                  CupertinoIcons.person_add,
                  color: theme.subText,
                  size: 20,
                ),
                title: CupertinoButton(
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: theme.textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => getEmail()),
                    );
                  },
                ),
              ),

              ListTile(
                title: Text(
                  "Appearance",
                  style: TextStyle(fontSize: 15, color: theme.subText),
                ),
              ),
              CupertinoListTile(
                //padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                leading: SizedBox(
                  child: Icon(
                    CupertinoIcons.brightness,
                    size: 20,
                    color: theme.subText,
                  ),
                ),
                title: Text(
                  ref.watch(mode),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: theme.textColor,
                  ),
                ),
                trailing: GifSwitchCupertino(
                  value: ref.watch(darkProvider),
                  onChanged: (bool val) {
                    ref.read(darkProvider.notifier).state = val;
                  },
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(color: theme.textColor),
          backgroundColor: theme.bg,
          toolbarHeight: 70.0,
          titleSpacing: 34.0,
          centerTitle: false,
          title: Text(
            'Efep',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: theme.textColor,
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
                  child: Icon(
                    CupertinoIcons.settings,
                    size: 35,
                    color: theme.subText,
                  ),
                  onPressed: () => Scaffold.of(ctx).openEndDrawer(),
                ),
              ),
            ),
          ],
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final bottomInset = MediaQuery.of(context).viewInsets.bottom;
            return SingleChildScrollView(
              padding: EdgeInsets.only(bottom: bottomInset),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Center(
                  child: SizedBox(
                    width: 370,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 100),
                        ClipOval(
                          child: Image.asset(
                            'assets/avatar.gif',
                            height: 126,
                            width: 126,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 30),
                        CupertinoTextField(
                          controller: userController,
                          padding: EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 12,
                          ),
                          placeholder: "  Username...",
                          style: TextStyle(color: theme.textColor),
                          placeholderStyle: TextStyle(color: theme.subText),
                          textInputAction: TextInputAction.next,
                          decoration: BoxDecoration(
                            color: theme.cardBg,
                            borderRadius: BorderRadius.circular(90),
                            border: Border.all(
                              color: theme.borderColor,
                              width: 0.4,
                            ),
                          ),
                          onChanged: (value) => {},
                        ),
                        SizedBox(height: 20),
                        CupertinoTextField(
                          controller: passController,
                          obscureText: true,
                          padding: EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 12,
                          ),
                          placeholder: "  Password...",
                          placeholderStyle: TextStyle(color: theme.subText),
                          style: TextStyle(color: theme.textColor),
                          textInputAction: TextInputAction.next,
                          decoration: BoxDecoration(
                            color: theme.cardBg,
                            borderRadius: BorderRadius.circular(90),
                            border: Border.all(
                              color: theme.borderColor,
                              width: 0.4,
                            ),
                          ),
                          onChanged: (value) {},
                        ),

                        SizedBox(height: 30),
                        SizedBox(
                          width: 200,
                          child: CupertinoButton(
                            borderRadius: BorderRadius.circular(90),
                            color: theme.button,
                            child: const Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              final notifier = ref.read(wpass.notifier);
                              if (!auth()) {
                                notifier.state = 'Wrong username or password!';
                                Future.delayed(const Duration(seconds: 5), () {
                                  if (mounted) notifier.state = null;
                                });
                                return;
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ChatScreen(),
                                  ),
                                );
                              }
                              notifier.state = null;
                            },
                          ),
                        ),
                        SizedBox(height: 30),
                        if (error != null)
                          Text(
                            error,
                            style: TextStyle(
                              color: theme.textColor,
                              fontSize: 15,
                            ),
                          ),

                        SizedBox(height: bottomInset > 0 ? 16 : 120),
                        Container(
                          margin: EdgeInsets.only(top: 50),
                          child: CupertinoButton(
                            child: const Text(
                              "Forgot password?",
                              style: TextStyle(color: Colors.grey),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => getEmail()),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
