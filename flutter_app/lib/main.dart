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
import './pages/expanded.dart';
import './pages/customScrollView.dart';
import './pages/future.dart';
import './pages/stream.dart';
import './pages/gesturepage.dart';
import './pages/animated.dart';
import './pages/heroAnimated.dart';

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
  Future<bool> showDeleteConfirmDialog1() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除当前文件吗?"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                //关闭对话框并返回true
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

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
              _uint8list == null ? Text("d") : Image.memory(_uint8list),
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
                      RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HeroAnimatedPage()));
                      },
                      child: Text("heroImage"),
                    ),

                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ScaleAnimalPage()));
                      },
                      child: Text("ScaleAnimalPage"),
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
                            builder: (context) => TextFieldPage()));
                      },
                      child: Text("输入框，表单"),
                    ),
                    RaisedButton.icon(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProgressPage()));
                        },
                        icon: Icon(Icons.add_alarm),
                        label: Text("指示器")),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ExpandedPage()));
                      },
                      child: Text("Expanded"),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CustomScrollViewPage()));
                      },
                      child: Text("CustomScrollViewPage"),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FuturePage()));
                      },
                      child: Text("FuturePage"),
                    ),
                                        RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => GestureDetecorPage()));
                      },
                      child: Text("GestureDetecorPage"),
                    ),

                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => StreamPage()));
                      },
                      child: Text("StreamPage"),
                    ),
                    RaisedButton(
                      child: Text("对话框1"),
                      onPressed: () async {
                        //弹出对话框并等待其关闭
                        bool delete = await showDeleteConfirmDialog1();
                        if (delete == null) {
                          print("取消删除");
                        } else {
                          print("已确认删除");
                          //... 删除文件
                        }
                      },
                    ),
                    DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.red, Colors.orange[700]]),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black54,
                                offset: Offset(3, 3),
                                blurRadius: 6)
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20.0),
                          child: Text(
                            "data",
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                    SizedBox(
                      height: 40,
                    ),
                    Transform(
                      transform: Matrix4.skewY(0.3),
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.deepOrangeAccent,
                        child: Text("Apartment"),
                      ),
                    ),
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
