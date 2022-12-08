import 'package:flutter/material.dart';
import 'package:pokemon_flame/model/wholeModel.dart';

class WholeRepository extends ChangeNotifier{

  WholeModel mo = WholeModel(
    isBattle: false
    );

  void battleMusicChange(bool bool){
    mo.isBattle = bool;
    notifyListeners();
  }
}