import 'package:api_start_project/crypto/model/crypto_model.dart';
import 'package:flutter/material.dart';

class CryptoMarketDetailScreen extends StatelessWidget {
  CryptoMarketDetailScreen({super.key, required this.cryptoModel});

  final CryptoModel cryptoModel;
  SizedBox size = const SizedBox(
    height: 8,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                  radius: 50,
                  child: Image.network(cryptoModel.image ?? 'No image')),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Name:${cryptoModel.name}"),
            size,
            Text("Current Price:${cryptoModel.currentPrice}"),
            size,
            Text("Market Cap:${cryptoModel.marketCap}.Cr"),
            size,
            Text("TotalVolume:${cryptoModel.totalVolume}"),
            size,
            Text("Symbol:${cryptoModel.symbol}"),
            size,
            Text("Max Supply:${cryptoModel.maxSupply}"),
            size,
            Text("Market Cap Rank:${cryptoModel.marketCapRank}"),
            size,
            Text("High 24Hr:${cryptoModel.high24h}"),
            size,
            Text("Low 24Hr:${cryptoModel.low24h}"),
            size,
            Text("PriceChange 24h:${cryptoModel.priceChange24h}"),
            size,
            Text(
                "PriceChangePercentage 24h:${cryptoModel.priceChangePercentage24h}"),
            size,
          ],
        ),
      ),
    );
  }
}
