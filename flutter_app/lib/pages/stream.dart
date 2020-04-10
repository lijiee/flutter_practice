import 'package:flutter/material.dart';
class StreamPage extends StatelessWidget {
  const StreamPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
Stream<int> counter() {
  return Stream.periodic(Duration(seconds: 1), (i) {
    return i;
  });
}    return Scaffold(
      appBar: AppBar(
        title:Text("streampage"),
      ),
      body: StreamBuilder(
        stream: counter(),
        builder: (BuildContext context,AsyncSnapshot<int> snapshot){
          if (snapshot.hasError) {
            return Text("FD${snapshot.error}");
          }
          switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text('没有Stream');
          case ConnectionState.waiting:
            return Text('等待数据...');
          case ConnectionState.active:
            return Text('active: ${snapshot.data}');
          case ConnectionState.done:
            return Text('Stream已关闭');
          }
          return null;

        }
        ),

    );
  }
}