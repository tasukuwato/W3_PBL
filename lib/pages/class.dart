import 'package:flutter/material.dart';

void main() => runApp(const ListTileApp());

class ListTileApp extends StatelessWidget {
  const ListTileApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const ClassPage(),
    );
  }
}

class ClassPage extends StatefulWidget {
  const ClassPage({Key? key}) : super(key: key);

  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  List<ListTileData> listTilesDataMonday = [
    // 月曜日のデータ
    ListTileData(title: '応用解析', isChecked: false, isLocked: false),
    ListTileData(title: '情報工学実験Ⅲ', isChecked: false, isLocked: false),
    ListTileData(title: '情報工学実験Ⅲ', isChecked: false, isLocked: false),
  ];
  List<ListTileData> originalListTilesDataMonday = [];

  List<ListTileData> listTilesDataTuesday = [
    // 火曜日のデータ
    ListTileData(title: 'プログラミング演習Ⅳ', isChecked: false, isLocked: false),
    ListTileData(title: 'プログラミング演習Ⅳ', isChecked: false, isLocked: false),
    ListTileData(title: 'デジタル回路Ⅱ', isChecked: false, isLocked: false),
    ListTileData(title: 'ソフトウェア工学', isChecked: false, isLocked: false),
    ListTileData(title: 'PBL概論', isChecked: false, isLocked: false),
  ];
  List<ListTileData> originalListTilesDataTuesday = [];

  List<ListTileData> listTilesDataWednesday = [
    // 水曜日のデータ
    ListTileData(title: 'アプリケーション開発', isChecked: false, isLocked: false),
    ListTileData(title: '画像処理', isChecked: false, isLocked: false),
    ListTileData(title: '言語・オートマトン', isChecked: false, isLocked: false),
    ListTileData(title: '英語コミュニケーション', isChecked: false, isLocked: false),
    ListTileData(title: 'PBL概論', isChecked: false, isLocked: false),
  ];
  List<ListTileData> originalListTilesDataWednesday = [];

  List<ListTileData> listTilesDataThursday = [
    // 木曜日のデータ
    ListTileData(title: 'ドイツ語', isChecked: false, isLocked: false),
    ListTileData(title: 'フランス語', isChecked: false, isLocked: false),
    ListTileData(title: '中国語', isChecked: false, isLocked: false),
    ListTileData(title: '技術者倫理', isChecked: false, isLocked: false),
    ListTileData(title: '体育Ⅳ', isChecked: false, isLocked: false),
  ];
  List<ListTileData> originalListTilesDataThursday = [];

  List<ListTileData> listTilesDataFriday = [
    // 金曜日のデータ
    ListTileData(title: '電磁気学', isChecked: false, isLocked: false),
    ListTileData(title: 'アジア文化論', isChecked: false, isLocked: false),
    ListTileData(title: '欧米文化論', isChecked: false, isLocked: false),
    ListTileData(title: 'デジタル信号処理Ⅱ', isChecked: false, isLocked: false),
    ListTileData(title: '情報理論', isChecked: false, isLocked: false),
  ];
  List<ListTileData> originalListTilesDataFriday = [];

  @override
  void initState() {
    super.initState();
    originalListTilesDataMonday = List.from(listTilesDataMonday);
    originalListTilesDataTuesday = List.from(listTilesDataTuesday);
    originalListTilesDataWednesday = List.from(listTilesDataWednesday);
    originalListTilesDataThursday = List.from(listTilesDataThursday);
    originalListTilesDataFriday = List.from(listTilesDataFriday);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Class'),
        backgroundColor: Color.fromARGB(255, 113, 111, 123),
      ),
      backgroundColor: Color.fromARGB(255, 41, 40, 49),
      body: ListView(
        children: [
          ListTile(
            title: const Text('月曜'),
            textColor: Colors.white,
          ),
          const Divider(),
          for (var i = 0; i < listTilesDataMonday.length; i++)
            if (listTilesDataMonday[i].isChecked)
              ListTile(
                key: ValueKey(listTilesDataMonday[i]),
                textColor: Colors.white,
                leading: Checkbox(
                  value: listTilesDataMonday[i].isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      if (!listTilesDataMonday[i].isLocked) {
                        listTilesDataMonday[i].isChecked = value ?? false;
                        _sortListTilesDataMonday();
                      }
                    });
                  },
                ),
                title: Text(listTilesDataMonday[i].title),
                trailing: Checkbox(
                  value: listTilesDataMonday[i].isLocked,
                  onChanged: (bool? value) {
                    setState(() {
                      listTilesDataMonday[i].isLocked = value ?? false;
                    });
                  },
                ),
              ),
          const Divider(),
          for (var i = 0; i < listTilesDataMonday.length; i++)
            if (!listTilesDataMonday[i].isChecked)
              ListTile(
                key: ValueKey(listTilesDataMonday[i]),
                leading: Checkbox(
                  value: listTilesDataMonday[i].isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      listTilesDataMonday[i].isChecked = value ?? false;
                      listTilesDataMonday[i].isLocked = value ?? false;
                      _sortListTilesDataMonday();
                    });
                  },
                ),
                title: Text(
                  listTilesDataMonday[i].title,
                  style: TextStyle(
                    color: Colors.grey, // チェックが入っていない要素の色を指定
                  ),
                ),
              ),
          const Divider(),
          ListTile(
            title: const Text('火曜'),
            textColor: Colors.white,
          ),
          const Divider(),
          for (var i = 0; i < listTilesDataTuesday.length; i++)
            if (listTilesDataTuesday[i].isChecked)
              ListTile(
                key: ValueKey(listTilesDataTuesday[i]),
                textColor: Colors.white,
                leading: Checkbox(
                  value: listTilesDataTuesday[i].isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      if (!listTilesDataTuesday[i].isLocked) {
                        listTilesDataTuesday[i].isChecked = value ?? false;
                        _sortListTilesDataTuesday();
                      }
                    });
                  },
                ),
                title: Text(listTilesDataTuesday[i].title),
                trailing: Checkbox(
                  value: listTilesDataTuesday[i].isLocked,
                  onChanged: (bool? value) {
                    setState(() {
                      listTilesDataTuesday[i].isLocked = value ?? false;
                    });
                  },
                ),
              ),
          const Divider(),
          for (var i = 0; i < listTilesDataTuesday.length; i++)
            if (!listTilesDataTuesday[i].isChecked)
              ListTile(
                key: ValueKey(listTilesDataTuesday[i]),
                leading: Checkbox(
                  value: listTilesDataTuesday[i].isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      listTilesDataTuesday[i].isChecked = value ?? false;
                      listTilesDataTuesday[i].isLocked = value ?? false;
                      _sortListTilesDataTuesday();
                    });
                  },
                ),
                title: Text(
                  listTilesDataTuesday[i].title,
                  style: TextStyle(
                    color: Colors.grey, // チェックが入っていない要素の色を指定
                  ),
                ),
              ),
          const Divider(),
          ListTile(
            title: const Text('水曜'),
            textColor: Colors.white,
          ),
          const Divider(),
          for (var i = 0; i < listTilesDataWednesday.length; i++)
            if (listTilesDataWednesday[i].isChecked)
              ListTile(
                key: ValueKey(listTilesDataWednesday[i]),
                textColor: Colors.white,
                leading: Checkbox(
                  value: listTilesDataWednesday[i].isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      if (!listTilesDataWednesday[i].isLocked) {
                        listTilesDataWednesday[i].isChecked = value ?? false;
                        _sortListTilesDataWednesday();
                      }
                    });
                  },
                ),
                title: Text(listTilesDataWednesday[i].title),
                trailing: Checkbox(
                  value: listTilesDataWednesday[i].isLocked,
                  onChanged: (bool? value) {
                    setState(() {
                      listTilesDataWednesday[i].isLocked = value ?? false;
                    });
                  },
                ),
              ),
          const Divider(),
          for (var i = 0; i < listTilesDataWednesday.length; i++)
            if (!listTilesDataWednesday[i].isChecked)
              ListTile(
                key: ValueKey(listTilesDataWednesday[i]),
                leading: Checkbox(
                  value: listTilesDataWednesday[i].isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      listTilesDataWednesday[i].isChecked = value ?? false;
                      listTilesDataWednesday[i].isLocked = value ?? false;
                      _sortListTilesDataWednesday();
                    });
                  },
                ),
                title: Text(
                  listTilesDataWednesday[i].title,
                  style: TextStyle(
                    color: Colors.grey, // チェックが入っていない要素の色を指定
                  ),
                ),
              ),
          const Divider(),
          ListTile(
            title: const Text('木曜'),
            textColor: Colors.white,
          ),
          const Divider(),
          for (var i = 0; i < listTilesDataThursday.length; i++)
            if (listTilesDataThursday[i].isChecked)
              ListTile(
                key: ValueKey(listTilesDataThursday[i]),
                textColor: Colors.white,
                leading: Checkbox(
                  value: listTilesDataThursday[i].isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      if (!listTilesDataThursday[i].isLocked) {
                        listTilesDataThursday[i].isChecked = value ?? false;
                        _sortListTilesDataThursday();
                      }
                    });
                  },
                ),
                title: Text(listTilesDataThursday[i].title),
                trailing: Checkbox(
                  value: listTilesDataThursday[i].isLocked,
                  onChanged: (bool? value) {
                    setState(() {
                      listTilesDataThursday[i].isLocked = value ?? false;
                    });
                  },
                ),
              ),
          const Divider(),
          for (var i = 0; i < listTilesDataThursday.length; i++)
            if (!listTilesDataThursday[i].isChecked)
              ListTile(
                key: ValueKey(listTilesDataThursday[i]),
                leading: Checkbox(
                  value: listTilesDataThursday[i].isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      listTilesDataThursday[i].isChecked = value ?? false;
                      listTilesDataThursday[i].isLocked = value ?? false;
                      _sortListTilesDataThursday();
                    });
                  },
                ),
                title: Text(
                  listTilesDataThursday[i].title,
                  style: TextStyle(
                    color: Colors.grey, // チェックが入っていない要素の色を指定
                  ),
                ),
              ),
          const Divider(),
          ListTile(
            title: const Text('金曜'),
            textColor: Colors.white,
          ),
          const Divider(),
          for (var i = 0; i < listTilesDataFriday.length; i++)
            if (listTilesDataFriday[i].isChecked)
              ListTile(
                key: ValueKey(listTilesDataFriday[i]),
                textColor: Colors.white,
                leading: Checkbox(
                  value: listTilesDataFriday[i].isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      if (!listTilesDataFriday[i].isLocked) {
                        listTilesDataFriday[i].isChecked = value ?? false;
                        _sortListTilesDataFryday();
                      }
                    });
                  },
                ),
                title: Text(listTilesDataFriday[i].title),
                trailing: Checkbox(
                  value: listTilesDataFriday[i].isLocked,
                  onChanged: (bool? value) {
                    setState(() {
                      listTilesDataFriday[i].isLocked = value ?? false;
                    });
                  },
                ),
              ),
          const Divider(),
          for (var i = 0; i < listTilesDataFriday.length; i++)
            if (!listTilesDataFriday[i].isChecked)
              ListTile(
                key: ValueKey(listTilesDataFriday[i]),
                leading: Checkbox(
                  value: listTilesDataFriday[i].isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      listTilesDataFriday[i].isChecked = value ?? false;
                      listTilesDataFriday[i].isLocked = value ?? false;
                      _sortListTilesDataFryday();
                    });
                  },
                ),
                title: Text(
                  listTilesDataFriday[i].title,
                  style: TextStyle(
                    color: Colors.grey, // チェックが入っていない要素の色を指定
                  ),
                ),
              ),
          const Divider(),
        ],
      ),
    );
  }

  void _sortListTilesDataMonday() {
    setState(() {
      listTilesDataMonday.sort((a, b) {
        if (a.isChecked && !b.isChecked) {
          return -1; // aがオンでbがオフなら、aをbより前にする
        } else if (!a.isChecked && b.isChecked) {
          return 1; // aがオフでbがオンなら、bをaより前にする
        } else {
// 両方の要素が同じ状態の場合は、元の順序を保持する
          return originalListTilesDataMonday
              .indexOf(a)
              .compareTo(originalListTilesDataMonday.indexOf(b));
        }
      });
    });
  }

  void _sortListTilesDataTuesday() {
    setState(() {
      listTilesDataMonday.sort((a, b) {
        if (a.isChecked && !b.isChecked) {
          return -1; // aがオンでbがオフなら、aをbより前にする
        } else if (!a.isChecked && b.isChecked) {
          return 1; // aがオフでbがオンなら、bをaより前にする
        } else {
// 両方の要素が同じ状態の場合は、元の順序を保持する
          return originalListTilesDataMonday
              .indexOf(a)
              .compareTo(originalListTilesDataMonday.indexOf(b));
        }
      });
    });
  }

  void _sortListTilesDataWednesday() {
    setState(() {
      listTilesDataMonday.sort((a, b) {
        if (a.isChecked && !b.isChecked) {
          return -1; // aがオンでbがオフなら、aをbより前にする
        } else if (!a.isChecked && b.isChecked) {
          return 1; // aがオフでbがオンなら、bをaより前にする
        } else {
// 両方の要素が同じ状態の場合は、元の順序を保持する
          return originalListTilesDataMonday
              .indexOf(a)
              .compareTo(originalListTilesDataMonday.indexOf(b));
        }
      });
    });
  }

  void _sortListTilesDataThursday() {
    setState(() {
      listTilesDataMonday.sort((a, b) {
        if (a.isChecked && !b.isChecked) {
          return -1; // aがオンでbがオフなら、aをbより前にする
        } else if (!a.isChecked && b.isChecked) {
          return 1; // aがオフでbがオンなら、bをaより前にする
        } else {
// 両方の要素が同じ状態の場合は、元の順序を保持する
          return originalListTilesDataMonday
              .indexOf(a)
              .compareTo(originalListTilesDataMonday.indexOf(b));
        }
      });
    });
  }

  void _sortListTilesDataFryday() {
    setState(() {
      listTilesDataMonday.sort((a, b) {
        if (a.isChecked && !b.isChecked) {
          return -1; // aがオンでbがオフなら、aをbより前にする
        } else if (!a.isChecked && b.isChecked) {
          return 1; // aがオフでbがオンなら、bをaより前にする
        } else {
// 両方の要素が同じ状態の場合は、元の順序を保持する
          return originalListTilesDataMonday
              .indexOf(a)
              .compareTo(originalListTilesDataMonday.indexOf(b));
        }
      });
    });
  }
}

class ListTileData {
  String title;
  bool isChecked;
  bool isLocked;

  ListTileData(
      {required this.title, required this.isChecked, required this.isLocked});
}
