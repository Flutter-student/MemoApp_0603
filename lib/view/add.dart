import 'package:flutter/material.dart';

class Add_Screen extends StatelessWidget {
  const Add_Screen({super.key});
  static final _controller_title= TextEditingController();
  static final _controller_Memo= TextEditingController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Memo',
      home: Scaffold(
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
                children:[
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/');
                    },
                    child: Text(
                      '破棄',
                      style: TextStyle(fontSize: 32.0, color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (){
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
      ),
    );
  }
  
  void ShowAlert(){
    //showDialog(context: context, builder:
  }
}