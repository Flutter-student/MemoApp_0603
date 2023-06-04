import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memo_app/view_model/disp/disp_service.dart';

class Disp_Screen extends ConsumerWidget {
  const Disp_Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = ref.watch(DispProvider.notifier);
    final _state = ref.watch(DispProvider);
    print(_state.memo);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('表示'),
      ),
      body: Column(
        children: [
          Align(
            child: ElevatedButton(
              onPressed: () {
                _controller.NavigationEdit(_state.number!, _state.memo!);
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
    );
  }
}
