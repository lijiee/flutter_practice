import 'package:flutter/material.dart';

class ExpandedPage extends StatelessWidget {
  const ExpandedPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ExpandedPage"),
      ),
      body: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: <Widget>[
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                child: Container(height: 30, color: Colors.red),
                flex: 1,
              ),
              Expanded(
                child: Container(color: Colors.yellow, height: 30),
                flex: 3,
              )
            ],
          ),
          Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: 200,
                child: Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Expanded(flex: 2, child: Container(color: Colors.red)),
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(flex: 1, child: Container(color: Colors.red))
                  ],
                ),
              )),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: <Widget>[
              Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text("M"),
                  ),
                  label: Text("mesfsfds")),
              Chip(
                label: Text("vsdfsdfsdfs"),
                avatar: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text("V"),
                ),
              ),
              Chip(
                label: Text("sdfsdfsdfs"),
                avatar: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text("S"),
                ),
              ),
              Chip(
                label: Text("fsdfsdfs"),
                avatar: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text("F"),
                ),
              ),
              Flow(
                delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
                children: <Widget>[
                  new Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.red,
                  ),
                  new Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.green,
                  ),
                  new Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.blue,
                  ),
                  new Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.yellow,
                  ),
                  new Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.brown,
                  ),
                  new Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.purple,
                  ),
                ],
              ),
            ],
          
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment : CrossAxisAlignment.start,
              children:<Widget>[
                Padding(
                  padding : const EdgeInsets.only(left:8),
                  child:Text("hello")
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical : 8),
                  child: Text("dddddd"),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text("data"),
                ),

              ],
              
            ),
            ),
        ],
      ),
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  getSize(BoxConstraints constraints) {
    //指定Flow的大小
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
