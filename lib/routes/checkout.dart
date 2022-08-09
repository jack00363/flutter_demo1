

import 'package:flutter/material.dart';
import 'package:ja_demo/routes/clean_air_condition.dart';

import '../constants.dart';
import '../models/air_condition_type.dart';
import '../widget/appbar.dart';
import '../widget/button.dart';

class CheckOutPage extends StatelessWidget{
  AirConditionType _data;
  double _padding = 20;


  CheckOutPage(this._data);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: getTitleAppBar('確認價格'),
        body: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: _padding,left: _padding,right: _padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("訂單內容",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text('服務項目',style: TextStyle(fontSize: 22))),
                    checkView(),
                    Image.asset("assets/air_condition_icon.png"),
                  ],
                )
            ),
            Spacer(),
            MyButton('結帳', (){
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context){
                return AlertDialog(
                  title: Text("結帳成功"),
                  actions: [MyButton("確定", ()=>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Clean_Air_Condition_Page()),(_)=>false))],
                );
              });
            })
          ],
        ),
      ),
    );
  }

  Row checkView() {
    return Row(
        children: [
          Expanded(child: Text(_data.typeName+"  X${_data.chooseCount}",style: TextStyle(fontSize: 18),)),
          Text('${_data.price*_data.chooseCount}',style: TextStyle(fontSize: 18))
        ],
      );
  }
}