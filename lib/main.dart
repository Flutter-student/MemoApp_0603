import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memo_app/model/Database/memo_app_database.dart';
import 'package:memo_app/model/repository/database_service.dart';
import 'package:memo_app/view/add.dart';
import 'package:memo_app/view/disp.dart';
import 'package:memo_app/view/edit.dart';
import 'package:memo_app/view/top.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = ref.read(databaseProvider.notifier);
    //##################################################################################
    // Widget作成中にstateが変更すると再描画を無限ループしてしまい、エラーになるのでコールバックを用いている
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _controller.connectionDatabase());
    //##################################################################################
    return MaterialApp(
      initialRoute: '/',
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
