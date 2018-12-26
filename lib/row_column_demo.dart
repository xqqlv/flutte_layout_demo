import 'package:flutter/material.dart';

class RowColumn extends StatefulWidget {
  final String title;

  const RowColumn({Key key, this.title}) : super(key: key);

  @override
  _RowColumnState createState() => _RowColumnState();
}

class _RowColumnState extends State<RowColumn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return Container(
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, //垂直方向居中对齐
                  children: <Widget>[
                    Text("hello world "),
                    Text("I am Jack "),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
    return ListView.builder(itemBuilder: _buildItem, itemCount: 7);
  }

  Widget _buildItem(BuildContext context, int index) {
    Widget child;
    switch (index) {
      case 0:
        child = Container(
          color: Colors.green,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("我是Colum的子控件"),
              Text("垂直布局"),
              Text("CrossAxisAlignment.start"),
            ],
          ),
        );
        break;
      case 1:
        child = Container(
          color: Colors.green,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("我是Colum的子控件"),
              Text("垂直布局"),
              Text("CrossAxisAlignment.center"),
            ],
          ),
        );
        break;
      case 2:
        child = Container(
          color: Colors.green,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text("我是Colum的子控件"),
              Text("垂直布局"),
              Text("CrossAxisAlignment.end"),
            ],
          ),
        );
        break;
      case 3:
        child = Container(
            color: Colors.blue,
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("我是Row的子控件  "),
                Text("水平布局  "),
                Text("MainAxisAlignment.start")
              ],
            ));
        break;
      case 4:
        child = Container(
            color: Colors.blue,
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("我是Row的子控件  "),
                Text("水平布局  "),
                Text("MainAxisAlignment.center")
              ],
            ));
        break;
      case 5:
        child = Container(
            color: Colors.blue,
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text("我是Row的子控件  "),
                Text("水平布局  "),
                Text("MainAxisAlignment.end")
              ],
            ));
        break;
    }

    return Card(child: child);
  }
}
