import 'package:flutter/material.dart';

class belanja extends ChangeNotifier {
  List<String> _item = [
    "Belanjaan x1",
  ];

  List<String> get item => _item;

  set setitem(val) {
    _item = val;
    ChangeNotifier();
  }

  void additem() {
    _item.add("Belanjaan x" + (_item.length + 1).toString());
    print("Berhasil");
    ChangeNotifier();
  }
}
