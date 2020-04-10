import 'package:flutter/material.dart';
import 'package:flutterapp/r.dart';
class CustomScrollViewPage extends StatelessWidget {
  const CustomScrollViewPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text("ddddd"),
              pinned: true,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                background:Image.asset(R.assetsImgsBackground1,fit: BoxFit.cover,)
              
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(8),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((BuildContext context,int index){
                  return Container(
                    alignment: Alignment.center,
                    child: Text("fdd$index"),
                    color: Colors.blue[100*(index%9)],

                  );
                },
                childCount: 40,
                ), 
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 4,
                  ),
                
                  ),
              
              ),
              SliverFixedExtentList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context,int index){
                    return Container(
                      alignment: Alignment.centerLeft,
                      color: Colors.cyan[100*(index%9)],
                      child: Text("ddddd$index"),
                    );
                    
                  },
                  childCount: 50,
                ), 
                itemExtent: 50
                )
            
          ],

        ),
      ),
    );
  }
}