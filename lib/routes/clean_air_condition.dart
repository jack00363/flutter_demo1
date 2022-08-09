

import 'package:flutter/material.dart';
import 'package:ja_demo/constants.dart';
import 'package:ja_demo/routes/checkout.dart';

import '../models/air_condition_type.dart';
import '../widget/appbar.dart';
import '../widget/button.dart';
import '../widget/count_number.dart';

class Clean_Air_Condition_Page extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_Clean_Air_Condition_Page();
  
}

class _Clean_Air_Condition_Page extends State{
  List<AirConditionType> datas=[];
  double _padding =15;
  int chooseIndex = -1;
  @override
  void initState() {
    super.initState();
    datas=[
      AirConditionType("分離式冷氣機（室內機）",2500),
      AirConditionType("分離式冷氣機（室內機＋室外機）",3000),
      AirConditionType("窗型冷氣機（三噸以下）",3500),
      AirConditionType("窗型冷氣機（三噸以上）",4000),
      AirConditionType("吊隱式冷氣機（室內機）",3200),
      AirConditionType("吊隱式冷氣機（室內機＋室外機）",3500),
    ];
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: getTitleAppBar('冷氣機清潔'),
        body:Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: _padding,left: _padding,right: _padding),
                padding: EdgeInsets.only(left: 5),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border(left: BorderSide(width: 3,color: MyColor().Myblue))
                ),
                child: Text("服務項目",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.all(_padding),
                child: Card(
                  child: ListView.separated(
                    primary: false,
                    itemCount: datas.length,
                    itemBuilder: (context,index){
                        return getListViewItem(datas[index],index);
                      }, separatorBuilder: (BuildContext context, int index) {
                        return Divider(thickness: 1,);
                  },),
                ),
              ),
            ),
            Offstage(
              offstage: !(chooseIndex>=0&&datas[chooseIndex].chooseCount!=0),
              child: MyButton('下一步',(){
                tapNextButton(context,datas[chooseIndex]);
              }),
            )
          ],
        )
      ),
    );
  }

  void tapNextButton(BuildContext context,AirConditionType data) {
     Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckOutPage(data)));
  }
  
  Widget getListViewItem(AirConditionType data, int index){
    double _fontSize = 18;
    return InkWell(
      onTap: ()=>setState(() {
        chooseIndex=index;
        refreshUi(index);
      }),
      child: Opacity(
        opacity: (chooseIndex==index|| chooseIndex<0)?1:0.4,
        child: Container(
          margin: EdgeInsets.all(10),
          child: Row(
            mainAxisSize:MainAxisSize.min,
            children: [
              Expanded(flex: 3,
                child: Column(
                  mainAxisSize:MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.typeName,style: TextStyle(fontSize: _fontSize),),
                    Text("\$ ${data.price}",style: TextStyle(fontSize: _fontSize,color: MyColor().Myblue,fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: setCount(
                      data.chooseCount,
                      10,
                      (int nowNumber){
                        if(index==chooseIndex) data.chooseCount = nowNumber;
                          else refreshUi(index);
                        setState(() => chooseIndex = index);
                      },
                      (int nowNumber){
                        if(index==chooseIndex) data.chooseCount=nowNumber;
                          else refreshUi(index);
                        setState(() =>chooseIndex=index);
                      }
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void refreshUi(int index) {
    for(int i=0;i<datas.length;i++){
      if(i==index) datas[i].chooseCount=1;
      else datas[i].chooseCount=0;
    }
  }
  
}