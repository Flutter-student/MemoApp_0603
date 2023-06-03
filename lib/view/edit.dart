import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Edit_Screen extends ConsumerWidget {
  const Edit_Screen({super.key});
  static final _controller_title = TextEditingController(text: 'タイトル初期値');
  static final _controller_Memo = TextEditingController(text: 'メモ初期値');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
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
                    Navigator.pushNamed(context, '/');
                  },
                  child: Text(
                    '削除',
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
    );
  }
}
