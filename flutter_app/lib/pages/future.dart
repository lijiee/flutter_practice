import 'package:flutter/material.dart';

class FuturePage extends StatelessWidget {
    Future<String> mockNetworkData() async {
  return Future.delayed(Duration(seconds: 2), () => "我是从互联网上获取的数据");
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("FuturePage"),
      ),
      body: Center(
        child:FutureBuilder<String>(
          future: mockNetworkData(),
          builder: (BuildContext context,AsyncSnapshot snapshot){

            if(snapshot.connectionState == ConnectionState.done){
              if(snapshot.hasError){
                return Text("error ${snapshot.error}");
              }else{
                return Text("${snapshot.data}");
              }
            }else{
              return CircularProgressIndicator(

              );


            }

          },
          

        ),
        
      ),

    );
  }
}