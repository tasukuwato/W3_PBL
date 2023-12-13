import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? _deviceHeight, _deviceWidth;
  List<String> tasks = ["タスク1", "タスク2", "タスク3"];

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    final Object? userNickName = ModalRoute.of(context)?.settings.arguments;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Task', textAlign: TextAlign.center),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // 検索アイコンのアクション
              },
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 74, 73, 73),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: _deviceWidth! * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _title(userNickName: userNickName,),
                Expanded(
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(tasks[index]),
                        ),
                      );
                    }
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _displayTaskAddDialog(context),
          tooltip: 'タスク追加',
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _title({Object? userNickName}) {
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
        ),
      ],
    );
  }

  // タスク追加ダイアログを表示する関数
  Future<void> _displayTaskAddDialog(BuildContext context) async {
    String taskName = '';
    String taskDeadline = '';
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('タスク追加'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  taskName = value;
                },
                decoration: InputDecoration(hintText: "タスク名"),
              ),
              TextField(
                onChanged: (value) {
                  taskDeadline = value;
                },
                decoration: InputDecoration(hintText: "期日"),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('キャンセル'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('追加'),
              onPressed: () {
                if (taskName.isNotEmpty) {
                  setState(() {
                    tasks.add("$taskName - $taskDeadline");
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      });
  }
}
