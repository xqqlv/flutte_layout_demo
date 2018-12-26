import 'package:flutter/material.dart';

class WrapFlow extends StatefulWidget {
  final String title;

  const WrapFlow({Key key, this.title}) : super(key: key);

  @override
  _WrapFlowState createState() => _WrapFlowState();
}

class _WrapFlowState extends State<WrapFlow> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          _wrap(),
          _flow()
        ],
      )
    );
  }

  Widget _wrap() {
    return Wrap(
      spacing: 10.0,
      direction: Axis.horizontal,
      alignment: WrapAlignment.start,
      children: <Widget>[
        _card('关注'),
        _card('推荐'),
        _card('新时代'),
        _card('小视频'),
        _card('党媒推荐'),
        _card('中国新唱将'),
        _card('历史'),
        _card('视频'),
        _card('游戏'),
        _card('头条号'),
        _card('数码'),
      ],
    );
  }

  Widget _card(String title) {
    return Card(child: Text(title),);
  }

  Widget _flow() {
    return Flow(
      delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
      children: <Widget>[
        new Container(width: 80.0, height:80.0, color: Colors.red,),
        new Container(width: 80.0, height:80.0, color: Colors.green,),
        new Container(width: 80.0, height:80.0, color: Colors.blue,),
        new Container(width: 80.0, height:80.0,  color: Colors.yellow,),
        new Container(width: 80.0, height:80.0, color: Colors.brown,),
        new Container(width: 80.0, height:80.0,  color: Colors.purple,),
      ],
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
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  getSize(BoxConstraints constraints){
    //指定Flow的大小
    return Size(double.infinity,200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}