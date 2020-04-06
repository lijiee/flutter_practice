import 'package:flutter/material.dart';
class ProgressPage extends StatefulWidget {
  ProgressPage({Key key}) : super(key: key);


  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  @override
  void initState() { 
    super.initState();
    _animationController = AnimationController (
      vsync: this,
      duration: Duration(seconds: 3)
      
      );
      _animationController.forward();
      _animationController.addListener(() {
        setState(() {
          
        });
      });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("指示器"),
      ),
      body: Column(
        children:<Widget>[
          Padding(
            padding : EdgeInsets.all(16),
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: ColorTween(
                begin: Colors.grey,
                end: Colors.blue,
              ).animate(_animationController),
              value: _animationController.value,
            ),
          ),
        ],
      ),


    );
  }
   @override
  void dispose() {
    print("parent-->dispose");
    _animationController.stop();
    super.dispose();
  }

  @override
  void deactivate() {
    super.deactivate();
    print("parent-->deactivate");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("parent-->reassemble");
  }


}