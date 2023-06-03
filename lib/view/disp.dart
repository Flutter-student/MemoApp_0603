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
            Padding(
                padding: EdgeInsets.all(15.0),
                child: Align(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/edit');
                    },
                    child: Text(
                      '編集',
                      style: TextStyle(
                          fontSize: 32.0,
                          color: Colors.red,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
                    ),
                  ),
                  alignment: Alignment.centerRight,
                ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text(
                'Memo_Title',
                style: TextStyle(fontSize: 30.0),
              ),
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
