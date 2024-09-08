
class Consts{

  static num commission(num amount, num commission){
    var weWillTake = amount * commission / 100;
    return weWillTake + amount;
  }

}