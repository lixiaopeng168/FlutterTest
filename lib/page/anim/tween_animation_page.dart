import 'package:flutter/material.dart';
import 'package:flutter_lxp_test/widght/animation/tween_animation_widget.dart';
import 'package:flutter_lxp_test/res/images.dart';
class TweenAnimationPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    print("TweenAnimationPage 01");
    // TODO: implement createState
    return new _TweenPageState();
  }

}
class _TweenPageState extends State<TweenAnimationPage>{
  TweenAnimationWidght animationUtils;

  List<String> _imageList = [];

  @override
  void initState() {
    print("TweenAnimationPage 02");
    super.initState();
    _imageList = [
      images.loading01,
      images.loading02,
      images.loading03,
      images.loading04,
      images.loading05,
      images.loading06,
      images.loading07,
    ];
    animationUtils = new TweenAnimationWidght(_imageList, 70, 70);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("TweenAnimationPage 03");
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      child: new Column(
        children: <Widget>[
          Container(margin: EdgeInsets.only(top: 100),),
            _animation(),
            _startAnimation(),
            _stopAnimation()
        ],
      ),
    );
  }



  _startAnimation() {
    return new RaisedButton(onPressed: (){
      animationUtils.startAnimation();


    },child: new Text("点击开始动画"),);
  }

  _stopAnimation() {
    return new RaisedButton(onPressed: (){
      animationUtils.stopAnimation();
    },
        child: new Text("点击暂停动画"));
  }

  _animation() {
//    return new TweenAnimationWidght(_imageList, 100, 100);
    return animationUtils;
  }

}
