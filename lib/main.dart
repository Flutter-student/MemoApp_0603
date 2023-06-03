import 'package:flutter/material.dart';
import 'view/top.dart';
import 'view/disp.dart';
import 'view/add.dart';
import 'view/edit.dart';
void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //ここ追加
      //意味は最初のルートパス（画面遷移先）を'/'にします。
      initialRoute: '/',
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //ここ追加
      //ここで記載してる　'/...'　がこの後出てくる [Navigator.pushNamed]で使えて画面遷移できるようになる
      routes: {
        '/': (context) => Top_Screen(),
        '/disp': (context) => Disp_Screen(),
        '/add': (context) => Add_Screen(),
        '/edit': (context) => Edit_Screen(),
      },
    );
  }
}