import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memo_app/model/repository/database_service.dart';
import 'package:memo_app/view_model/top/top_service.dart';

class Top_Screen extends ConsumerWidget {
  const Top_Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = ref.read(TopProvider.notifier);
    final _state = ref.watch(databaseProvider).memoList;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('メモアプリ'),
      ),
      body: Center(
        child: _state == null
            ? Container()
            : ListView.builder(
                //routes: appRoutes,
                shrinkWrap: true,
                itemCount: _state.length,
                itemBuilder: (context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: GestureDetector(
                      onTap: () async {
                        await _controller.NavigationDisp(index, _state[index]);
                        Navigator.pushNamed(context, '/disp');
                      },
                      child: Container(
                        child: Text(
                          '${_state[index].title}',
                          style: TextStyle(fontSize: 32.0, color: Colors.black),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
