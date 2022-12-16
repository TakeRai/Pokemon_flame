import 'package:flutter/foundation.dart';
import 'package:pokemon_flame/model/battleModel.dart';

class BattleRepository extends ChangeNotifier{
  BattleModel mo = BattleModel(
    choiceMovesPage: false,
    playerMonsterOpacity: 0,
    playerRemainHP: 400
    );

  void choiceMove(bool bool){
    mo.choiceMovesPage = bool;
    notifyListeners();
  }
  
  void MonsterOpChange_P(double opacity){
    mo.playerMonsterOpacity = opacity;
    notifyListeners();
  }

  void SetHPSmooth()async{
    int newPlayerHP = mo.playerRemainHP - 20;

    while(mo.playerRemainHP > newPlayerHP) {
      mo.playerRemainHP = mo.playerRemainHP -1;
      await Future.delayed(const Duration(milliseconds: 3));
      notifyListeners();
    }
  }
}