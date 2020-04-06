import 'package:flutter/material.dart';

class SwitchAndCheckBox extends StatefulWidget {
  SwitchAndCheckBox({Key key}) : super(key: key);

  @override
  _SwitchAndCheckBoxState createState() => _SwitchAndCheckBoxState();
}

class _SwitchAndCheckBoxState extends State<SwitchAndCheckBox> {
  bool _switchSelected = false;
  bool _checkboxSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("switch")),
      body: ListView(
        children: <Widget>[
          Expanded(
            child: Row(
          
              crossAxisAlignment: CrossAxisAlignment.center,
          
              children: <Widget>[
                Switch(
                  value: _switchSelected,
                  activeTrackColor: Colors.red,
                  onChanged: (value) {
                    setState(() {
                      _switchSelected = value;
                    });
                  },
                ),
                Text(_switchSelected ? "开" : "关")
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                  value: _checkboxSelected,
                  activeColor: Colors.yellow,
                  onChanged: (value) {
                    setState(() {
                      _checkboxSelected = value;
                    });
                  },
                ),
                Text(_checkboxSelected ? "开" : "关")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
