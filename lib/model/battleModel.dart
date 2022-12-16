import 'package:pokemon_flame/battle/battlePage.dart';

class BattleModel{
  BattleModel({
    required this.choiceMovesPage,
    required this.playerRemainHP,
    required this.playerMonsterOpacity
  });
  bool choiceMovesPage;
  int playerRemainHP;
  double playerMonsterOpacity;
}