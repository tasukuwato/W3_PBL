import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? _deviceHeight, _deviceWidth;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    final Object? userNickName = ModalRoute.of(context)?.settings.arguments;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        //ヘッダーの追加
        appBar: AppBar(
          title: Text('Task', textAlign: TextAlign.center),//センタリング
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                //検索アイコンのアクションを一旦定義せずに進めるのでここは空にしてあります
              },
            ),
          ],
        ),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: _deviceWidth! * 0.05),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _title(
                      userNickName: userNickName,
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
  Widget _title({Object? userNickName}) {
    Object? userNickname = userNickName;
    TextStyle titleStyle = TextStyle(
      fontSize: _deviceWidth! * 0.1,
      fontWeight: FontWeight.w600,
    );
    return Column(
      children: [
        AnimatedTextKit(
          animatedTexts: [
            FadeAnimatedText('ようこそ'),
          ],
          isRepeatingAnimation: false,
          onFinished:
              () {
            // Navigator.pushNamed(context, 'home2', arguments: userNickname);
          },
        ),
      ],
    );
  }
}
