import 'package:flutter/foundation.dart';
import 'package:pokemon_flame/model/battleModel.dart';

class BattleRepository extends ChangeNotifier{
  BattleModel mo = BattleModel(
    choiceMovesPage: false,
    playerMonsterOpacity: 0
    );

  void choiceMove(bool bool){
    mo.choiceMovesPage = bool;
    notifyListeners();
  }
  
  void MonsterOpChange_P(double opacity){
    mo.playerMonsterOpacity = opacity;
    notifyListeners();
  }
}