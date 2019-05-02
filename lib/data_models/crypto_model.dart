class Crypto{
  //instance variables for class
  //check what you getting from api json to get properties
  //https://api.coinmarketcap.com/v1/ticker/?limit=50
  String name;
  String rank;
  String priceInUsd;
  String oneHourPercentChange;
  String symbol;

  //constructor
  Crypto({this.name,this.rank,this.priceInUsd,this.oneHourPercentChange, this.symbol});

//named constructor mapping of values from api
  Crypto.fromMap(Map<String,dynamic> map):
        name = map["name"],
        rank = map["rank"],
        priceInUsd =map["price_usd"],
        symbol = map["symbol"],
        oneHourPercentChange =map["percent_change_1h"];

}