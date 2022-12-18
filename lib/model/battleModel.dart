import 'package:pokemon_flame/battle/battlePage.dart';

class BattleModel{
  BattleModel({
    required this.pageIndex,
    required this.playerRemainHP,
    required this.animationSwitch,
    required this.playerMonsterOpacity
  });
  int pageIndex;
  int playerRemainHP;
  List<bool> animationSwitch;
  double playerMonsterOpacity;
}