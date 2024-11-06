class CryptoModel {
  String? id;
  String? symbol;
  String? name;
  String? image;
  double? currentPrice;
  double? marketCap;
  double? marketCapRank;
  double? fullyDilutedValuation;
  double? totalVolume;
  double? high24h;
  double? low24h;
  double? priceChange24h;
  double? priceChangePercentage24h;
  double? marketCapChange24h;
  double? marketCapChangePercentage24h;
  double? circulatingSupply;
  double? totalSupply;
  double? maxSupply;
  double? ath;
  double? athChangePercentage;
  String? athDate;
  double? atl;
  double? atlChangePercentage;
  String? atlDate;
  String? lastUpdated;

  CryptoModel(
      {id,
        symbol,
        name,
        image,
        currentPrice,
        marketCap,
        marketCapRank,
        fullyDilutedValuation,
        totalVolume,
        high24h,
        low24h,
        priceChange24h,
        priceChangePercentage24h,
        marketCapChange24h,
        marketCapChangePercentage24h,
        circulatingSupply,
        totalSupply,
        maxSupply,
        ath,
        athChangePercentage,
        athDate,
        atl,
        atlChangePercentage,
        atlDate,

        lastUpdated});
  CryptoModel.fromJson(Map<String, dynamic> json) {
    id != json['id'];
    symbol = json['symbol'];
    name = json['name'];
    image = json['image'];

    currentPrice = _parseToDouble(json['current_price']);
    marketCap = _parseToDouble(json['market_cap']);
    marketCapRank = _parseToDouble(json['market_cap_rank']);
    fullyDilutedValuation = _parseToDouble(json['fully_diluted_valuation']);
    totalVolume = _parseToDouble(json['total_volume']);
    high24h = _parseToDouble(json['high_24h']);
    low24h = _parseToDouble(json['low_24h']);
    priceChange24h = _parseToDouble(json['price_change_24h']);
    priceChangePercentage24h = _parseToDouble(json['price_change_percentage_24h']);
    marketCapChange24h = _parseToDouble(json['market_cap_change_24h']);
    marketCapChangePercentage24h = _parseToDouble(json['market_cap_change_percentage_24h']);
    circulatingSupply = _parseToDouble(json['circulating_supply']);
    totalSupply = _parseToDouble(json['total_supply']);
    maxSupply = _parseToDouble(json['max_supply']);
    ath = _parseToDouble(json['ath']);
    athChangePercentage = _parseToDouble(json['ath_change_percentage']);
    athDate = json['ath_date'];
    atl = _parseToDouble(json['atl']);
    atlChangePercentage = _parseToDouble(json['atl_change_percentage']);
    atlDate = json['atl_date'];
    lastUpdated = json['last_updated'];
  }

  double? parseToDouble(dynamic value) {
    if (value == null) {
      return null;
    }
    if (value is int) {
      return value.toDouble();
    }
    if (value is double) {
      return value;
    }
    return null;
  }


  double? _parseToDouble(dynamic value) {
    if (value == null) {
      return null;
    }
    if (value is int) {
      return value.toDouble();
    }
    if (value is double) {
      return value;
    }
    return null;
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['symbol'] = symbol;
    data['name'] = name;
    data['image'] = image;
    data['current_price'] = currentPrice;
    data['market_cap'] = marketCap;
    data['market_cap_rank'] = marketCapRank;
    data['fully_diluted_valuation'] = fullyDilutedValuation;
    data['total_volume'] = totalVolume;
    data['high_24h'] = high24h;
    data['low_24h'] = low24h;
    data['price_change_24h'] = priceChange24h;
    data['price_change_percentage_24h'] = priceChangePercentage24h;
    data['market_cap_change_24h'] = marketCapChange24h;
    data['market_cap_change_percentage_24h'] =
        marketCapChangePercentage24h;
    data['circulating_supply'] = circulatingSupply;
    data['total_supply'] = totalSupply;
    data['max_supply'] = maxSupply;
    data['ath'] = ath;
    data['ath_change_percentage'] = athChangePercentage;
    data['ath_date'] = athDate;
    data['atl'] = atl;
    data['atl_change_percentage'] = atlChangePercentage;
    data['atl_date'] = atlDate;
    data['last_updated'] = lastUpdated;
    return data;
  }
}
