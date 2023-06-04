import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memo_app/view_model/add/add_service.dart';
import 'package:memo_app/view_model/add/add_state.dart';

class Add_Screen extends ConsumerWidget {
  const Add_Screen({super.key});
  static final _controller_title = TextEditingController();
  static final _controller_Memo = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = ref.read(AddProvider.notifier);
    final _state = ref.watch(AddProvider);
    return _state is AddStateInitializing
        ? CircularProgressIndicator()
        : WillPopScope(
            onWillPop: () async {
              _controller_title.clear();
              _controller_Memo.clear();
              return true;
            },
            child: Scaffold(
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
                            Navigator.pushNamed(context, '/');
                          },
                          child: Text(
                            '破棄',
                            style:
                                TextStyle(fontSize: 32.0, color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await _controller.AddMemo();
                            _controller_title.clear();
                            _controller_Memo.clear();
                            Navigator.pushNamed(context, '/');
                          },
                          child: Text(
                            '保存',
                            style:
                                TextStyle(fontSize: 32.0, color: Colors.white),
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
