
import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  TextFieldPage({Key key}) : super(key: key);

  @override
  _TextFieldPageState createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
 TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _formKey = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title:Text("textField"),
      ),
      body: Padding(padding: const EdgeInsets.all(20),
      child: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              autofocus: true,
              controller: _unameController,
              decoration: InputDecoration(
                labelText : "用户名",
                hintText : "用户名或邮箱",
                icon:Icon(Icons.people)
              ),
              validator: (v){
                return v.trim().length > 0 ? null : "用户名不能为空";
              },
            ),
            TextFormField(
              controller: _pwdController,
              decoration: InputDecoration(
                labelText : "密码",
                hintText : "您的登录密码",
                icon:Icon(Icons.lock)
              ),
              obscureText: true,
              validator: (v){
                 return v.trim().length > 5 ? null : "密码不能少于6位";
              },
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      onPressed:(){
                        if((_formKey.currentState as FormState).validate()){
                          _scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                            content: Text("你好"),
                            duration: Duration(milliseconds: 2000),
                            
                          ));
                        }

                      } ,
                      child: Text("登录"),
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,

                    )
                    ),
                ],
                
              ),
            ),

          ],
        ),
        key: _formKey,
        ),


      ),
    );
  }
}