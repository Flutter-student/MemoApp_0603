import 'package:flutter/material.dart';

class Disp_Screen extends StatelessWidget {
  const Disp_Screen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Memo',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Memo'),
        ),
        body: Center(
          child: Column(
            children: [
                ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/edit');
                  },
                  child: Text(
                    '編集',
                    style: TextStyle(fontSize: 32.0, color: Colors.white),
                  ),
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
      ),
    );
  }
}