import 'package:flutter/material.dart';
import 'package:ja_demo/constants.dart';

class MyButton extends StatelessWidget{
  String _title;
  void Function() tap;

  MyButton(this._title,this.tap);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: ()=>tap(),
      child: Container(
        width: size.width,
        color: MyColor().Myblue,
        alignment: Alignment.center,
        padding: EdgeInsets.all(15),
        child: Text(_title,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
      ),
    );
  }

}