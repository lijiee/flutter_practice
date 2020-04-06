import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'dart:io';
import './pages/images.dart';
import './pages/switchs.dart';
import './pages/textField.dart';
import './pages/progress.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Uint8List _uint8list;
  String _string = "dd";
  @override
  void initState() {
    super.initState();

    String data = "";
    if (Platform.isIOS) {
      data = "sc";
      print("aa");
    } else {
      data = "ic_launcher";
      print("dd");
    }
    var future = _communicateFunction(data);
    future.then((data) {
      setState(() {
        _uint8list = data;
      });
    });
  }

//
  static const communicateChannel =
      MethodChannel('com.meetyou.flutter/native_image');
  //异步执行调用原生方法，保持页面不卡住，因为调用原生的方法可能没实现会抛出异常，所以trycatch包住
  _communicateFunction(flutterPara) async {
    //原生方法名为callNativeMethond,flutterPara为flutter调用原生方法传入的参数，await等待方法执行
    final result =
        await communicateChannel.invokeMethod('callNativeMethond', flutterPara);
    return result;
    //如果原生方法执行回调传值给flutter，那下面的代码才会被执行
    // setState(() {
    // _uint8list = result;
    // });
  }

  var gestureRecognizer = TapGestureRecognizer()
    ..onTap = () {
      print("点击");
    };

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be

            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  _uint8list == null ? Text("d") : Image.memory(_uint8list),
                ],
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: "home"),
                    TextSpan(
                      text: "https://www.baidu.com",
                      style: TextStyle(color: Colors.blue),
                      recognizer: gestureRecognizer,
                    ),
                  ],
                ),
              ),
              DefaultTextStyle(
                style: TextStyle(color: Colors.red, fontSize: 20.0),
                textAlign: TextAlign.start,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("dd"),
                    Text("data"),
                    Text(
                      "ddd",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontFamily: 'Raleway',
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ImageLoad()));
                      },
                      child: Text("图片"),
                    ),
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SwitchAndCheckBox()));
                        },
                        child: Text("开关")),
                    OutlineButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TextFieldPage()
                        ));
                      },
                      child: Text("输入框，表单"),
                    ),
                    RaisedButton.icon(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>ProgressPage()));
                          
                        },
                        icon: Icon(Icons.add_alarm),
                        label: Text("指示器")),
                  ],
                ),
              ),
            ],
          ),
          // This trailing c
        ],
      ),
    );
  }
}
