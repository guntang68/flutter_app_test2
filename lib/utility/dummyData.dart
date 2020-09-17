import 'package:flutter/foundation.dart';

class DummyData with ChangeNotifier{

  String _nama;
  int _number=10;
  int _counter;

  inc(){
    _number ++;
    notifyListeners();
  }

  dec(){
    _number --;
    notifyListeners();
  }
  int get number => _number;

  set number(int value) {
    _number = value;
    notifyListeners();
  }

  String get nama => _nama;

  set nama(String value) {
    _nama = value;
    notifyListeners();
  }
}