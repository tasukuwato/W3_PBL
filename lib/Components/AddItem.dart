import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final _formKey = GlobalKey<FormState>();
  String _taskName = '';
  DateTime _dueDate = DateTime.now();
  int _notificationDays = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(), // ダークモードにする
      home: Scaffold(
        appBar: AppBar(
          title: Text('タスク'),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[

              TextFormField(
                decoration: InputDecoration(labelText: 'タスク名'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'タスク名を入力してください';
                  }
                  return null;
                },
                onSaved: (value) {
                  _taskName = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: '期日'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '期日を入力してください';
                  }
                  return null;
                },
                onSaved: (value) {
                  _dueDate = DateTime.parse(value!);
                },
              ),
              DropdownButtonFormField<int>(
                value: _notificationDays,
                items: [1, 2, 3].map((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text('$value 日前'),
                  );
                }).toList(),
                onChanged: (int? newValue) {
                  setState(() {
                    _notificationDays = newValue!;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.pushNamed(context, '/home', arguments: {
                      'taskName': _taskName,
                      'dueDate': _dueDate,
                      'notificationDays': _notificationDays,
                    });
                  }
                },
                child: Text('Done'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
