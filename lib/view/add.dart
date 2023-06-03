import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Add_Screen extends ConsumerWidget {
  const Add_Screen({super.key});
  static final _controller_title = TextEditingController();
  static final _controller_Memo = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Memo',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('追加'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                'Title',
                style: TextStyle(fontSize: 30.0),
              ),
              TextField(
                controller: _controller_title,
                style: TextStyle(fontSize: 30.0),
              ),
              Text(
                'Memo',
                style: TextStyle(fontSize: 30.0),
              ),
              TextField(
                controller: _controller_Memo,
                style: TextStyle(fontSize: 30.0),
                maxLines: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showDialog<void>(
                          barrierDismissible: false,
                          context: context,
                          builder: (_) {
                            return Alert();
                          });
                    },
                    child: Text(
                      '破棄',
                      style: TextStyle(fontSize: 32.0, color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: Text(
                      '保存',
                      style: TextStyle(fontSize: 32.0, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Alert extends StatelessWidget {
  const Alert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('本当に削除しますか？'),
      content: Text('削除すると復元できません'),
      actions: <Widget>[
        ElevatedButton(
          child: Text('破棄'),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        ElevatedButton(
          child: Text('キャンセル'),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
