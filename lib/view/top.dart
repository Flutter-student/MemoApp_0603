import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memo_app/model/repository/database_service.dart';
import 'package:memo_app/view_model/top/top_service.dart';

class Top_Screen extends ConsumerWidget {
  const Top_Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = ref.read(TopProvider.notifier);
    final _state = ref.watch(databaseProvider).memoList;
    return MaterialApp(
      title: 'Flutter Memo',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('メモアプリ'),
        ),
        body: Center(
          child: Column(
            children: [
              for (var i = 0; i < 3; i++) ...{
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _controller.NavigationDisp(0, _state![0]);
                      Navigator.pushNamed(context, '/disp');
                    },
                    child: Text(
                      'This is Test',
                      style: TextStyle(fontSize: 32.0, color: Colors.white),
                    ),
                  ),
                ),
              },
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/add');
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
