import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StackPositioned extends StatefulWidget {
  final String title;

  const StackPositioned({Key key, this.title}) : super(key: key);

  @override
  _StackPositionedState createState() => _StackPositionedState();
}

class _StackPositionedState extends State<StackPositioned> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: _positioned()
    );
  }

  Widget _positioned() {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
        children: <Widget>[
          Container(child: Text("Hello world",style: TextStyle(color: Colors.white)),
            color: Colors.red,
          ),
          Positioned(
            left: 18.0,
            child: Text("I am Jack"),
          ),
          Positioned(
            top: 18.0,
            child: Text("Your friend"),
          )
        ],
      ),
    );
  }
}

/// 带有菊花和文字的loading（有灰色背景）
/// 使用Stack封装，你传入的主视图在最下面一层，背景层在中间，最上面一层为菊花和文字loading，用isLoading控制显示
///
/// ## Sample code
///
/// ```dart
///   Loading(
///     child: Text(),
///     isLoading: isDialogLoading,
///     text: loadingText,
///   );
/// ```
///
/// <img src="http://me.wozaihui.com/Loading.png">
class Loading extends StatelessWidget {
  /// ProgressIndicator的padding，决定loading的大小
  final EdgeInsets padding = EdgeInsets.all(30.0);

  /// 文字顶部距菊花的底部的距离
  final double margin = 10.0;

  /// 圆角
  final double cornerRadius = 10.0;

  final Widget _child;
  final bool _isLoading;
  final double opacity;
  final Color color;
  final String text;

  Loading({
    Key key,
    @required child,
    @required isLoading,
    this.text,
    this.opacity = 0.3,
    this.color = Colors.grey,
  })  : assert(child != null),
        assert(isLoading != null),
        _child = child,
        _isLoading = isLoading,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = List<Widget>();
    widgetList.add(_child);
    if (_isLoading) {
      final loading = [
        Opacity(
          opacity: opacity,
          child: ModalBarrier(dismissible: false, color: color),
        ),
        _buildProgressIndicator()
      ];
      widgetList.addAll(loading);
    }
    return Stack(
      children: widgetList,
    );
  }

  Widget _buildProgressIndicator() {
    return Center(
      child: Container(
        padding: padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CupertinoActivityIndicator(),
            Padding(
                padding: EdgeInsets.only(top: margin),
                child: Text(text ?? '加载中...')),
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
            color: Colors.white),
      ),
    );
  }
}
