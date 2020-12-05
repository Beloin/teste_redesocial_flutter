import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share/share.dart';
import 'package:social_share/social_share.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String text = 'FisioApp test';
  final String body = 'Testing values';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste de Rede Social',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Share Test'),
        ),
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(size: 22),
          backgroundColor: Color(0xFF801E48),
          visible: true,
          curve: Curves.bounceIn,
          children: [
            SpeedDialChild(
              child: GestureDetector(
                child: SvgPicture.asset(
                  'assets/svg_icons/facebook.svg',
                  fit: BoxFit.cover,
                ),
                onTap: () {},
              ),
              backgroundColor: Colors.white,
            ),
            SpeedDialChild(
              child: GestureDetector(
                child: SvgPicture.asset(
                  'assets/svg_icons/instagram.svg',
                  fit: BoxFit.cover,
                ),
                onTap: () async {
                  // SocialShare.shareInstagramStory(
                  //   'assets/fisio.jpg',
                  //   "#ffffff",
                  //   "#000000",
                  //   "https://deep-link-url",
                  // );
                },
              ),
              backgroundColor: Colors.white,
            ),
            SpeedDialChild(
              child: GestureDetector(
                child: SvgPicture.asset(
                  'assets/svg_icons/twitter.svg',
                  fit: BoxFit.cover,
                ),
                onTap: () {
                  SocialShare.shareTwitter('Hello From FisioApp');
                },
              ),
              backgroundColor: Colors.white,
            ),
            SpeedDialChild(
              child: GestureDetector(
                child: SvgPicture.asset(
                  'assets/svg_icons/whatsapp.svg',
                  fit: BoxFit.fitHeight,
                ),
                onTap: () {
                  SocialShare.shareWhatsapp("Hello World");
                },
              ),
              backgroundColor: Colors.white,
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                onPressed: () async {
                  final RenderBox renderBox = context.findRenderObject();
                  await Share.share(
                    text,
                    subject: body,
                    sharePositionOrigin:
                        renderBox.localToGlobal(Offset.zero) & renderBox.size,
                  );
                },
                child: Text('Share Test 1'),
              ),
              FlatButton(
                onPressed: () async {
                  SocialShare.shareOptions("FisioApp Test");
                },
                child: Text('Share Test 2'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
