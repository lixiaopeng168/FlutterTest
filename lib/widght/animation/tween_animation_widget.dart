import 'package:flutter/material.dart';

class TweenAnimationWidght extends StatefulWidget {
  List<String> _imageList;
  double _width;
  double _height;
  int interval = 80;

  _TweenAnimationState _state ;

  TweenAnimationWidght(this._imageList, this._width, this._height,
      {this.interval = 100}){
   _state =  new _TweenAnimationState();
    print("tweenExecute 01");
  }

  @override
  State<StatefulWidget> createState() {
    print("tweenExecute 02");
    return _state;
  }


  void startAnimation(){
    _state.startAnimation();
  }

  void stopAnimation(){
    _state.stopAnimation();
  }

  void disposeAnimation(){
    _state.disposeAnimation();
    _state = null;
  }
}

class _TweenAnimationState extends State<TweenAnimationWidght>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  List<Widget> images = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 把所有图片都加载进内容，否则每一帧加载时会卡顿
//    for (int i = 0; i < widget._imageList.length; ++i) {
//        images.add(Image.asset(
//          widget._imageList[i],
//          width: 0,
//          height: 0,
//        ));
//    }

//    print("tweenExecute 03");
    int animationCount = widget._imageList.length;
    //最大时间
    int maxTime = animationCount * widget.interval;
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: maxTime));
    _controller.addStatusListener((AnimationStatus state) {
      if (state == AnimationStatus.completed) {
        //完成后重新开始
        _controller.forward(from: 0.0);
      }
    });

    _animation = new Tween<double>(begin: 0, end: animationCount.toDouble())
        .animate(_controller)
          ..addListener(() {
            setState(() {});
          });

  }
  void startAnimation(){
    _controller.forward();
  }
  void stopAnimation(){
    _controller.stop();
  }
  void disposeAnimation(){
    _controller.dispose();
    _controller = null;
    _animation.removeListener(null);
    _animation = null;
  }


  @override
  void dispose() {
//    print("tweenExecute 04");
    _controller.dispose();
//    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int ix = _animation.value.floor() % widget._imageList.length;
    List<Widget> images = [];
//    // 把所有图片都加载进内容，否则每一帧加载时会卡顿,这个作用是将图片设为0，否则会有图片的残影
    for (int i = 0; i < widget._imageList.length; ++i) {
      if (i != ix) {
        images.add(Image.asset(
          widget._imageList[i],
          width: 0,
          height: 0,
        ));
      }
    }
    //只将需要的帧设大小，其他的都是0
    images.add(Image.asset(
      widget._imageList[ix],
      width: widget._width,
      height: widget._height,
    ));
//    print("tweenExecute 05 $ix");

    // TODO: implement build
    return Stack(alignment: AlignmentDirectional.center, children: images);
  }
}
