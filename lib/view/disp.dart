import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Disp_Screen extends ConsumerWidget {
  const Disp_Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Memo',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('表示'),
        ),
        body: Column(
          children: [
            Align(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/edit');
                },
                child: Text(
                  '編集',
                  style: TextStyle(fontSize: 32.0, color: Colors.white),
                ),
              ),
              alignment: Alignment.centerRight,
            ),
            Text(
              'Memo_Title',
              style: TextStyle(fontSize: 30.0),
            ),
            Text(
              'Memo_Value',
              style: TextStyle(fontSize: 30.0),
            ),
          ],
        ),
      ),
    );
  }
}
