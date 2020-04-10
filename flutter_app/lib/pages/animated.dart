import 'package:flutter/material.dart';
import 'package:flutterapp/r.dart';
class AnimatedImage extends AnimatedWidget{
  AnimatedImage({Key key,Animation<double> animation}) : super(key : key,listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Image.asset(
        R.assetsImgsBackground,
        width: animation.value,
        height: animation.value,
      ),

    );
  }
}

class ScaleAnimalPage extends StatefulWidget {
  ScaleAnimalPage({Key key}) : super(key: key);

  @override
  _ScaleAnimalPageState createState() => _ScaleAnimalPageState();
}

class _ScaleAnimalPageState extends State<ScaleAnimalPage> with SingleTickerProviderStateMixin{
  Animation<double> animation;
  AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this,duration: const Duration(seconds:3));
    animation = Tween(begin: 0.0,end: 300.0,).animate(animationController);
    animationController.forward();
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed){

      }
      
    });

  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("ScaleAnimalPage"),
      ),
      body: AnimatedImage(
        animation: animation,

      ),

    );
    dispose(){
      animationController.dispose();

      super.dispose();
    }
  }
}