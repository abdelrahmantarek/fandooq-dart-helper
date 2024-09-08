
class Consts{

  static num get percentageCommission => 5;

  static num commission(num amount){
    var weWillTake = amount * percentageCommission / 100;
    return weWillTake + amount;
  }

}