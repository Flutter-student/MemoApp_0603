import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Top_Screen extends ConsumerWidget {
  const Top_Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/disp');
                  },
                  child: Text(
                    'This is Test',
                    style: TextStyle(fontSize: 32.0, color: Colors.white),
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
