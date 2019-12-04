import 'package:flutter/material.dart';
import 'package:flutter_lxp_test/page/anim/basis_animation_page.dart';
import 'package:flutter_lxp_test/page/anim/tween_animation_page.dart';
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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

  var listData = List();
  @override
  void initState() {
    listData.add("基本动画");
    listData.add("帧动画");
    listData.add("3");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:new ListView.builder(
        padding: EdgeInsets.all(5),
          itemBuilder:(BuildContext context,int index){
           return _ItemBuilder(context,index);
          },
        itemCount: listData.length,
//          itemExtent: 3,


      ),

    );
  }

  _ItemBuilder(BuildContext context,int index){
    return new InkWell(
      onTap: (){_clickItemListener(index);},
      child:new Container(
        padding: new EdgeInsets.all(20),
        margin: new EdgeInsets.only(top: 20),
        decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            border:Border.all(
                color: Colors.blue,
                width: 1.0,
                style: BorderStyle.solid
            )
        ),
        child: new Text("${listData[index]}"),
      ) ,
    ) ;
  }

  _clickItemListener(int index ){
    switch(index){
      case 0: //基本动画
        _clickBasisAnimation();
        break;
      case 1: //帧动画
        _clickTweenAnimation();
        break;
    }
  }

  //基本动画
  _clickBasisAnimation(){
    Navigator.of(context).push(new MaterialPageRoute(builder: (_){
      return  new BasisAnimationPage();
    }));
  }
  //帧动画
  _clickTweenAnimation(){

    Navigator.of(context).push(new MaterialPageRoute(builder: (_){
       return new TweenAnimationPage();
    }));
  }

}
