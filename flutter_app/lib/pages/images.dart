import 'package:flutter/material.dart';
class ImageLoad extends StatelessWidget {
  const ImageLoad({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("dd"),
      ),
      body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
           Image.network("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586172276425&di=54627767ed99665ba59aa4f6d78066d3&imgtype=0&src=http%3A%2F%2Fa3.att.hudong.com%2F14%2F75%2F01300000164186121366756803686.jpg"
           ,width: 200,
           fit: BoxFit.cover,
           repeat:ImageRepeat.repeat ,
           color: Colors.blue,
           colorBlendMode: BlendMode.difference,)
      ],
    ),
    );
  }
}