import 'package:flutter/material.dart';
import 'package:flutter_lxp_test/res/images.dart';
/**
 * 动画
 */
class BasisAnimationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _BasisAnimationState();
  }
}

class _BasisAnimationState extends State<BasisAnimationPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curve;
  Animation<double> animation;
  bool isAnimationCurveStatus = false;
  double width = 0.0;
  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: new Duration(milliseconds: 2000));
    curve = new CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
    animation = new Tween(begin: 0.0,end: 1.0).animate(controller);
    animation.addListener((){
      setState(() {

      });
      print("BasisAnimationPage  ${curve.value} \t$width");
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(width == 0) {
      width = MediaQuery
          .of(context)
          .size
          .width;
    }
    // TODO: implement build
    return  new Material(
      child:  new SingleChildScrollView(
            child:new Column(
              children: <Widget>[
                _scaleAnimation(),
                _rotateAnimation(),
                _translateAnimation(),
                _alphaAnimation(),
                _clickExecuteTopAnimation()
              ] ,
            )
      ),
    );
  }

  /// 缩放动画
  _scaleAnimation() {
    return   new Container(
          child: new Transform.scale(
            scale: curve.value,
            child: new FlutterLogo(size: 100,)
//            new Image.asset(images.img_test,
//            width: 100,height: 100,)
          ),
        );
  }

  /// 旋转动画
  _rotateAnimation() {
    return new Container(
//      width: width,
//      height: 100,
      child: new Transform.rotate(
        angle: curve.value * 3,
        child: new FlutterLogo(
          size: 100.0,
        ),
      ),
    );
  }

  /// 平移动画
  _translateAnimation() {
    return new Container(
//      width: width,
//      height: 100,
      child:  new Transform.translate(
        offset: new Offset(100.0 * curve.value, 0.0),
        child: new FlutterLogo(size: 100.0,),
      ),
    );
  }
  /// 渐变动画
  _alphaAnimation() {
    return new Container(
      child: new FadeTransition(
        opacity: controller,
        child: new FlutterLogo(size: 100.0,),
      ),
    ) ;
  }
  /// 执行上面的动画
  _clickExecuteTopAnimation() {
    return new RaisedButton(onPressed: (){
      if(isAnimationCurveStatus){
        controller.reverse();
      }else{
        controller.forward();
      }
      isAnimationCurveStatus = !isAnimationCurveStatus;
    },
      child: Text("点击执行动画1"),
      textColor: Colors.blue,
      color: Colors.amberAccent,
    );
  }
}
