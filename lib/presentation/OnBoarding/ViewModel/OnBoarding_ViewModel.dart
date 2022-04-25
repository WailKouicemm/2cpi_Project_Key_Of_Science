import 'dart:async';

import 'package:keyofscience/presentation/Base/baseviewmodel.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
   final StreamController<int> _pageIndexStreamController = StreamController<int>();
   final StreamController<List> _selectedIndexesStreamController = StreamController<List>();
  int _currentIndex=0;
  List<int> _indexes=[];
  @override
  void dispose() {
    print("disposedispose called");
    _pageIndexStreamController.close();
  }


  @override
  void start() {
    _postData_index_toView();
  }
  void start1() {
    _postData_selectedItems_toView();
  }

  @override
  void onPageChanged(int index) {
    _currentIndex=index;
    _postData_index_toView();
  }

  @override
  Sink get inputIndex => _pageIndexStreamController.sink;

  @override
  Stream<int> get outputIndex => _pageIndexStreamController.stream.map((index)=>index);




  @override
  // TODO: implement InputSelectItem
  Sink get InputSelectItem => _selectedIndexesStreamController.sink;

   @override
   // TODO: implement outputSelectItem
   Stream<List> get outputSelectItem => _selectedIndexesStreamController.stream.map((list) => list);

  @override
  void onSelectedItem(int index) {
    _indexes.contains(index)? _indexes.remove(index) : _indexes.add(index);
     _postData_selectedItems_toView();
  }

 /// interat to view
   void _postData_index_toView(){
     inputIndex.add(_currentIndex);
   }

   void _postData_selectedItems_toView(){
     InputSelectItem.add(_indexes);
   }
}

abstract class OnBoardingViewModelInputs {
  void onPageChanged(int index);
  void onSelectedItem(int index);
  Sink get inputIndex;
  Sink get InputSelectItem;
}

abstract class OnBoardingViewModelOutputs {
  Stream<int> get outputIndex;
  Stream<List> get outputSelectItem;

}


