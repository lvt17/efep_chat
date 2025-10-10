import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'new_pass.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:efep_chat/core/providers/providers.dart';

class Verify extends ConsumerStatefulWidget {
  const Verify({super.key});

  bool auth(String value) {
    return false;
  }

  @override
  ConsumerState<Verify> createState() => _VerifyState();
}

class _VerifyState extends ConsumerState<Verify> {
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
    final theme = ref.watch(themeChange);
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
                          placeholder: "  Enter OTP code",
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
                              "Continue",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => NewPass()),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 23),
                        // if (wError != null)
                        //   Padding(
                        //     padding: const EdgeInsets.only(top: 8),
                        //     child: Text(
                        //       wError!,
                        //       style: TextStyle(color: theme.textColor),
                        //     ),
                        //   ),
                        SizedBox(height: 140),
                        Container(
                          margin: EdgeInsets.only(top: 70),
                          child: CupertinoButton(
                            child: const Text(
                              "You have recieved OTP code yet?",
                              style: TextStyle(color: Colors.grey),
                            ),
                            onPressed: () {
                              //Navigator.pop(context);
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
