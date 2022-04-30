import 'package:flutter/material.dart';

class pageIndexProvider with ChangeNotifier {
int index=0;

void onPageChanges(int index){
  this.index = index;
  notifyListeners();
}
}

class selectedItemProvier with ChangeNotifier {
  List<String> selectedItems = [];
  void onItemSelected(String item){
    if(selectedItems.contains(item)){
      selectedItems.remove(item);
    }else{
      selectedItems.add(item);
    }
    notifyListeners();
  }
}