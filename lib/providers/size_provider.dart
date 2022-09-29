import 'package:flutter/material.dart';

class SetSize extends ChangeNotifier{
  String _size = 'All';

  String get size => _size;

  set size(String newSize){
    _size = newSize;
    notifyListeners();
  }
}