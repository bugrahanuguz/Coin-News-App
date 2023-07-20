class TopCoinModel {
  String? sId;
  String? id;
  String? symbol;
  String? name;
  String? image;
  num? currentPrice;
  num? marketCap;
  num? totalVolume;
  num? iV;
  String? coincapId;

  TopCoinModel(
      {this.sId,
      this.id,
      this.symbol,
      this.name,
      this.image,
      this.currentPrice,
      this.marketCap,
      this.totalVolume,
      this.iV,
      this.coincapId});

  TopCoinModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    symbol = json['symbol'];
    name = json['name'];
    image = json['image'];
    currentPrice = json['current_price'];
    marketCap = json['market_cap'];
    totalVolume = json['total_volume'];
    iV = json['__v'];
    coincapId = json['coincapId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['id'] = this.id;
    data['symbol'] = this.symbol;
    data['name'] = this.name;
    data['image'] = this.image;
    data['current_price'] = this.currentPrice;
    data['market_cap'] = this.marketCap;
    data['total_volume'] = this.totalVolume;
    data['__v'] = this.iV;
    data['coincapId'] = this.coincapId;
    return data;
  }
}
