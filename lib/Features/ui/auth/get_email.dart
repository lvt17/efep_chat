import 'package:efep_chat/core/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'verify.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class getEmail extends ConsumerStatefulWidget {
  const getEmail({super.key});

  bool auth(String value) {
    return false;
  }

  @override
  ConsumerState<getEmail> createState() => _getEmailState();
}

class _getEmailState extends ConsumerState<getEmail> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool auth(String value) {
    if (passController.text == 'Lieutoan7788a@gmail.com') {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    // THEME
    final theme = ref.watch(themeChange);
    //
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: (theme.bg),
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
                        ),
                        SizedBox(height: 30),
                        SizedBox(
                          width: 200,
                          child: CupertinoButton(
                            borderRadius: BorderRadius.circular(90),
                            color: theme.button,
                            child: const Text(
                              "Send OTP",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => Verify()),
                              );
                            },
                          ),
                        ),

                        // if (wError != null)
                        //   Padding(
                        //     padding: const EdgeInsets.only(top: 8),
                        //     child: Text(wError!, style: TextStyle(color: theme.textColor)),
                        //   ),
                        SizedBox(height: bottomInset > 0 ? 16 : 120),
                        Container(
                          margin: EdgeInsets.only(top: 110),
                          child: CupertinoButton(
                            child: const Text(
                              "Did you have an account?",
                              style: TextStyle(color: Colors.grey),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
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
