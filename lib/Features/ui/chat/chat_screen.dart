import 'package:efep_chat/Features/ui/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:efep_chat/core/providers/providers.dart';
import 'package:efep_chat/Features/ui/widget/switchCustom.dart';
//import 'package:efep_chat/Features/ui/widget/theme.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  //scroll controller
  final _sc = ScrollController();
  //define chatid
  final String chatId = 'l.vt17_';
  //get message
  final TextEditingController Message = TextEditingController();
  //keep new message in last
  @override
  void dispose() {
    Message.dispose();
    _sc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //message processing
    final notifier = ref.read(messages(chatId).notifier);

    final pm = ref.watch(messages(chatId));

    ref.listen<List<String>>(messages(chatId), (prev, next) {
      if ((prev?.length ?? 0) != next.length) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_sc.hasClients) {
            _sc.animateTo(
              0,
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOut,
            );
          }
        });
      }
    });

    //typing
    final onTyping = ref.watch(typing);

    // THEME
    final theme = ref.watch(themeChange);

    //label dark : light mode
    final appearance = ref.watch(mode);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
        ref.read(typing.notifier).state = false;
      },
      child: Scaffold(
        onDrawerChanged: (isOpened) {
          if (isOpened) FocusManager.instance.primaryFocus?.unfocus();
        },
        resizeToAvoidBottomInset: true,
        backgroundColor: (theme.bg),
        drawer: Drawer(
          shape: Border(),
          backgroundColor: theme.drawerBg,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              //SizedBox(height: 20),
              DrawerHeader(
                padding: EdgeInsets.fromLTRB(16.0, 26.0, 16.0, 16.0),
                margin: EdgeInsets.only(bottom: 0),
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
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        "Accounts",
                        style: TextStyle(fontSize: 15, color: theme.subText),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CupertinoButton(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 8),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(180),
                                  color: Colors.black,
                                  border: BoxBorder.all(
                                    color: theme.subText,
                                    width: 2,
                                  ),
                                ),
                                child: ClipOval(
                                  child: Image.asset(
                                    'assets/myPic.jpeg',
                                    height: 40,
                                    width: 40,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Lieu Vinh Toan",
                                style: TextStyle(
                                  color: theme.textColor,
                                  fontWeight: FontWeight.w400,
                                  //fontFamily: 'BBHSansBogle-Regular',
                                  fontSize: 20,
                                  letterSpacing: -0.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: CupertinoButton(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 8),
                              Icon(
                                CupertinoIcons.lock_shield,
                                size: 30,
                                color: theme.textColor,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Log out",
                                style: TextStyle(
                                  color: theme.textColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                  letterSpacing: -0.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => Login()),
                            (route) => false,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text(
                  "Appearance",
                  style: TextStyle(fontSize: 15, color: theme.subText),
                ),
              ),
              CupertinoListTile(
                leading: SizedBox(
                  child: Icon(
                    CupertinoIcons.brightness,
                    size: 20,
                    color: theme.subText,
                  ),
                ),
                title: Text(
                  appearance,
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
          automaticallyImplyLeading: false,
          toolbarHeight: 45.0,
          titleSpacing: -7,
          centerTitle: false,
          title: Builder(
            builder: (ctx) => Padding(
              padding: EdgeInsets.only(left: 14),
              child: CupertinoButton(
                child: Text(
                  'Efep',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: theme.textColor,
                    fontSize: 30,
                    fontFamily: 'Knewave',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onPressed: () => Scaffold.of(ctx).openDrawer(),
              ),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: Container(
              alignment: Alignment.centerLeft,
              height: 70,
              width: 400,
              decoration: BoxDecoration(
                color: theme.profileCard,
                borderRadius: BorderRadius.circular(90),
                border: Border.all(color: theme.borderColor, width: 0.5),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.only(
                      left: 6,
                      right: 8,
                      top: 10,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(180),
                      color: Colors.black,
                      border: BoxBorder.all(color: theme.subText, width: 2),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/myPic.jpeg',
                        height: 45,
                        width: 45,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Container(
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lieu Vinh Toan",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 20,
                            color: theme.textColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: '.SF Pro Display',
                          ),
                        ),
                        Text(
                          "l.vt17",
                          style: TextStyle(fontSize: 15, color: theme.subText),
                        ),
                      ],
                    ),
                  ),
                  //SizedBox(width: 110),
                  Spacer(),
                  Icon(
                    CupertinoIcons.phone_fill,
                    color: theme.button,
                    size: 30,
                  ),
                  SizedBox(width: 20),
                  Icon(
                    CupertinoIcons.video_camera_solid,
                    color: theme.button,
                    size: 45,
                  ),
                  SizedBox(width: 18),
                ],
              ),
            ),
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final buttomInset = MediaQuery.of(context).viewInsets.bottom;
            return SingleChildScrollView(
              padding: EdgeInsets.only(bottom: buttomInset),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: constraints.maxHeight),
                child: SafeArea(
                  child: Center(
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            controller: _sc,
                            reverse: true,
                            padding: const EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 12,
                            ),
                            itemCount: pm.length,
                            itemBuilder: (_, i) => ListTile(
                              dense: true,
                              visualDensity: const VisualDensity(vertical: -4),
                              contentPadding: EdgeInsets.only(top: 1),
                              minVerticalPadding: 0,
                              title: Row(
                                children: [
                                  Spacer(),
                                  Container(
                                    // height: 50,
                                    // width: 200,
                                    child: Text(
                                      " ${pm[i]} ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 0.5,
                                        color: theme.button,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                      color: theme.button,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 8,
                            right: 8,
                            bottom: buttomInset + 8,
                          ),
                          child: Row(
                            children: [
                              if (!onTyping)
                                CupertinoButton(
                                  child: Icon(
                                    CupertinoIcons.add_circled_solid,
                                    size: 25,
                                    color: theme.button,
                                  ),
                                  onPressed: () {},
                                ),
                              if (!onTyping)
                                CupertinoButton(
                                  padding: EdgeInsets.only(left: 2, right: 22),
                                  minSize: 0,
                                  child: Icon(
                                    CupertinoIcons.camera_fill,
                                    size: 25,
                                    color: theme.button,
                                  ),
                                  onPressed: () {},
                                ),
                              if (!onTyping)
                                CupertinoButton(
                                  padding: EdgeInsets.only(left: 2, right: 18),
                                  minSize: 0,
                                  child: Icon(
                                    CupertinoIcons.photo_fill,
                                    size: 25,
                                    color: theme.button,
                                  ),
                                  onPressed: () {},
                                ),
                              if (!onTyping)
                                CupertinoButton(
                                  padding: EdgeInsets.only(left: 2, right: 12),
                                  minSize: 0,
                                  child: Icon(
                                    CupertinoIcons.mic_fill,
                                    size: 25,
                                    color: theme.button,
                                  ),
                                  onPressed: () {},
                                ),
                              if (onTyping)
                                CupertinoButton(
                                  minSize: 0,
                                  padding: EdgeInsets.only(left: 8, right: 5),
                                  child: Icon(
                                    CupertinoIcons.chevron_forward,
                                    size: 25,
                                    color: theme.button,
                                  ),
                                  onPressed: () {
                                    ref.read(typing.notifier).state = false;
                                  },
                                ),
                              Container(
                                height: 50,
                                width: onTyping ? 320 : 155,
                                child: CupertinoTextField(
                                  controller: Message,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 10,
                                  ),
                                  placeholder: " Aa",
                                  placeholderStyle: TextStyle(
                                    color: theme.subText,
                                  ),
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
                                  onTap: () {
                                    ref.read(typing.notifier).state = true;
                                  },
                                ),
                              ),

                              CupertinoButton(
                                padding: EdgeInsets.only(left: 6, right: 1),
                                minSize: 0,
                                child: Transform.rotate(
                                  angle: 0.8,
                                  alignment: Alignment.center,
                                  child: Icon(
                                    CupertinoIcons.paperplane_fill,
                                    size: 35,
                                    color: theme.button,
                                  ),
                                ),
                                onPressed: () {
                                  notifier.state = [
                                    ...notifier.state,
                                    Message.text,
                                  ];
                                  Message.clear();
                                },
                              ),
                            ],
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
