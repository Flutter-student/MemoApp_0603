import 'package:flutter/material.dart';

class Add_Screen extends StatelessWidget {
  const Add_Screen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Memo',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Good evening!!!'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                'Add_Screen',
                style: TextStyle(fontSize: 30.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}