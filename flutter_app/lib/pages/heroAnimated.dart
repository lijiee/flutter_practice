import 'package:flutter/material.dart';
import 'package:flutterapp/r.dart';
class HeroAnimatedPage extends StatelessWidget {
  const HeroAnimatedPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("HeroAnimatedPage"),
      ),
      body: Container(
        alignment:Alignment.topCenter,
        child:InkWell(
          child: Hero(
            tag: "AVATAR",
            child: ClipOval(
              child:Image.asset(R.assetsImgsBackground,width: 100,),
            )),
            onTap: (){
              Navigator.push(context, PageRouteBuilder(pageBuilder:(BuildContext context,Animation animation,Animation secondaryAnimation){
               return FadeTransition(
                 opacity: animation,
                 child: Scaffold(
                   appBar:AppBar(
                     title:Text("xiangqing"),
                   ),
                   body:DetailPage(),
                   
                 ),
               );
              }));

            },
          
        ),
      ),

    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: "AVATAR", 
        child: Image.asset(R.assetsImgsBackground)
        ),
    );
  }
}