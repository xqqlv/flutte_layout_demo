import 'package:flutter/material.dart';

class FlexExpanded extends StatefulWidget {
  final String title;

  const FlexExpanded({Key key, this.title}) : super(key: key);

  @override
  _FlexExpandedState createState() => _FlexExpandedState();
}

class _FlexExpandedState extends State<FlexExpanded> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Row(children: <Widget>[
        RaisedButton(
          onPressed: () {
            print('点击红色按钮事件');
          },
          color: Colors.red,
          child: Text('红色按钮'),
        ),
        Expanded(
          flex: 1,
          child: RaisedButton(
            onPressed: () {
              print('点击黄色按钮事件');
            },
            color: Colors.yellow,
            child: Text('黄色按钮'),
          ),
        ),
        RaisedButton(
          onPressed: () {
            print('点击粉色按钮事件');
          },
          color: Colors.green,
          child: Text('绿色按钮'),
        ),
      ]),
    );
  }
}
