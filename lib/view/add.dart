import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memo_app/view_model/add/add_service.dart';

class Add_Screen extends ConsumerWidget {
  const Add_Screen({super.key});
  static final _controller_title = TextEditingController();
  static final _controller_Memo = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = ref.read(AddProvider.notifier);
    return Scaffold(
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
                    style: TextStyle(fontSize: 32.0, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await _controller.AddMemo();
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
    );
  }

  void ShowAlert() {
    //showDialog(context: context, builder:
  }
}
