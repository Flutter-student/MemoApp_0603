import 'package:flutter/material.dart';

class Top_Screen extends StatelessWidget {
  const Top_Screen({super.key});

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
              for(var i=0; i<3; i++)...{
                ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/disp');
                  },
                  child: Text(
                    'This is Test',
                    style: TextStyle(fontSize: 32.0, color: Colors.white),
                  ),
                ),
              },
              Text(
                'Top_Screen',
                style: TextStyle(fontSize: 30.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}