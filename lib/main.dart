import 'package:flutter/material.dart';
import 'package:flutter_layout_demo/flex_expanded_demo.dart';
import 'package:flutter_layout_demo/row_column_demo.dart';
import 'package:flutter_layout_demo/stack_positioned_demo.dart';
import 'package:flutter_layout_demo/wrap_flow_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter布局Widget'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _listData = [
    "线性布局Row和Column",
    "弹性布局Flex",
    "流式布局Wrap、Flow",
    "层叠布局Stack、Positioned"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return ListView.builder(
        itemBuilder: _buildItem, itemCount: _listData.length);
  }

  Widget _buildItem(BuildContext context, int index) {
    return Card(
      child: RaisedButton(
        onPressed: () {
          switch (index) {
            case 0:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => RowColumn(
                            title: _listData[index],
                          )));
              break;
            case 1:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => FlexExpanded(
                        title: _listData[index],
                      )));
              break;
            case 2:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => WrapFlow(
                        title: _listData[index],
                      )));
              break;
            case 3:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => StackPositioned(
                        title: _listData[index],
                      )));
              break;
          }
        },
        color: Color(0xFF079770),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            _listData[index],
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
