import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustmSnack {
  static SuccessSnackbar(BuildContext ctx,String msg){
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text(msg,style: TextStyle(color: Colors.white),),backgroundColor: Colors.green,));
  }

   static FailureSnackbar(BuildContext ctx,String msg){
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text(msg,style: TextStyle(color: Colors.white),),backgroundColor: Colors.red,));
  }

}
