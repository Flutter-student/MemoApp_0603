import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memo_app/view_model/edit/edit_service.dart';

class Edit_Screen extends ConsumerWidget {
  Edit_Screen({super.key});
  final _controller_title = TextEditingController();
  final _controller_Memo = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = ref.read(EditProvider.notifier);
    final _state = ref.watch(EditProvider);

    return WillPopScope(
      onWillPop: () async {
        _controller_title.clear();
        _controller_Memo.clear();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('編集'),
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
                onChanged: (String value) {
                  _controller.InputTitle(value);
                },
              ),
              Text(
                'Memo',
                style: TextStyle(fontSize: 30.0),
              ),
              TextField(
                controller: _controller_Memo,
                style: TextStyle(fontSize: 30.0),
                onChanged: (String value) {
                  _controller.InputMemo(value);
                },
                maxLines: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // background
                      foregroundColor: Colors.white, // foreground
                    ),
                    onPressed: () {
                      _controller.DeleteMemo();
                      _controller_title.clear();
                      _controller_Memo.clear();
                      Navigator.pushNamed(context, '/');
                    },
                    child: Text(
                      '削除',
                      style: TextStyle(fontSize: 32.0, color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _controller.UpdateMemo();
                      _controller_title.clear();
                      _controller_Memo.clear();
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
