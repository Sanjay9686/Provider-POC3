import 'dart:async';

import 'package:flutter/cupertino.dart';




class AddList with ChangeNotifier{
  List<String> item=["Sanjay","Ashwin","Afinas"];
  Stream<List<String> >get itemData async*{

   for (var i=0;i<item.length;i++){
    await Future.delayed(Duration(seconds:2));
        yield item.sublist(0,i+1);
        notifyListeners();
  }


  }
}
