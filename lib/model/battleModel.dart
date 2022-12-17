import 'package:pokemon_flame/battle/battlePage.dart';

class BattleModel{
  BattleModel({
    required this.pageIndex,
    required this.playerRemainHP,
    required this.playerMonsterOpacity
  });
  int pageIndex;
  int playerRemainHP;
  double playerMonsterOpacity;
}