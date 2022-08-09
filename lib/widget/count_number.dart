import 'package:flutter/material.dart';
import 'package:ja_demo/constants.dart';


Widget setCount(int number, int max, Function onMinus, Function onPlus){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      InkWell(
          onTap: (){
            if(number>1) {
              number--;
              onMinus(number);
            }
          },
          child: Icon(Icons.remove_circle_rounded,color: MyColor().Myblue,)
      ),
      Container(
          child: Text("$number")),
      InkWell(
          onTap: (){
            if(number<max) {
              number++;
              onPlus(number);
            }
          },
          child: Icon(Icons.add_circle_rounded,color: MyColor().Myblue,)
      ),
    ],
  );
}