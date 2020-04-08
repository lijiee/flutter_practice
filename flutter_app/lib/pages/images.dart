import 'package:flutter/material.dart';

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
    // TODO: implement initState
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
           Image.network("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586172276425&di=54627767ed99665ba59aa4f6d78066d3&imgtype=0&src=http%3A%2F%2Fa3.att.hudong.com%2F14%2F75%2F01300000164186121366756803686.jpg"
           ,width: 200,
           fit: BoxFit.cover,
           repeat:ImageRepeat.repeat ,
           color: Colors.blue,
           colorBlendMode: BlendMode.difference,),
           Text(e)
      ],
     );

      }).toList(),
        ),
    );
}
}


