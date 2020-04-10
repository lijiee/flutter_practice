import 'package:flutter/material.dart';
import 'package:flutterapp/r.dart';

class ImageLoad extends StatefulWidget {
  ImageLoad({Key key}) : super(key: key);

  @override
  _ImageLoadState createState() => _ImageLoadState();
}

class _ImageLoadState extends State<ImageLoad> with SingleTickerProviderStateMixin{
      List tabs = ["新闻", "历史", "图片"];
      TabController _tabController;
      @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("dd"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: (){
          })
        ],
        leading:IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
          Navigator.of(context).pop();
          }),
          bottom: TabBar(tabs: tabs.map((e) => Tab(text:e)).toList(),controller: _tabController,),

          
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        items:[
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("data")),
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("data"))
        ]
       ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e){
          return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(e)
      ],
     );

      }).toList(),
        ),
    );
}
}


