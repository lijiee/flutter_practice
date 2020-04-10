import 'package:flutter/material.dart';
import 'package:flutterapp/r.dart';
class GestureDetecorPage extends StatefulWidget {
  GestureDetecorPage({Key key}) : super(key: key);

  @override
  _GestureDetecorPageState createState() => _GestureDetecorPageState();
}

class _GestureDetecorPageState extends State<GestureDetecorPage> {
  double _width = 200;
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("GestureDetecorPage"),
      ),
      body: Center(
        child: GestureDetector(
          child: Image.asset(R.assetsImgsBackground),
          onScaleUpdate: (ScaleUpdateDetails e){
            setState(() {
              _width = 200 *  e.scale.clamp(.8, 10);
            });

          },

        ),
           
      ),
    );
  }

  // double _top = 0.0;
  // double _left = 0.0;
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title:Text("GestureDetecorPage"),
  //     ),
  //     body:Stack(
  //       children: <Widget>[
  //         Positioned(
  //           top: _top,
  //           left: _left,
  //           child: GestureDetector(
  //             child: CircleAvatar(
  //               child:Text("S"),
  //             ),
  //             onPanDown: (DragDownDetails e){
  //               print("${e.globalPosition}");
  //             },
  //             onPanUpdate: (DragUpdateDetails e){
  //               setState(() {
  //                 _left += e.delta.dx;
  //                 _top += e.delta.dy;
  //               });
  //             },

  //           )
  //         ),
  //       ],

  //     ),

  //   );
  // }
}