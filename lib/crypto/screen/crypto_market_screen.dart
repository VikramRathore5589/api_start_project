import 'package:api_start_project/crypto/model/crypto_model.dart';
import 'package:api_start_project/crypto/provider/crypto_provider.dart';
import 'package:api_start_project/core/app_bar_widget.dart';
import 'package:api_start_project/crypto/screen/crypto_market_detail_screen.dart';
import 'package:api_start_project/crypto/service/crypto_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CryptoMarketScreen extends StatefulWidget {
  const CryptoMarketScreen({super.key});

  @override
  State<CryptoMarketScreen> createState() => _CryptoMarketScreenState();
}

class _CryptoMarketScreenState extends State<CryptoMarketScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Consumer<CryptoProvider>(
        builder: (context, provider, child) {
          return FutureBuilder<List<CryptoModel>>(
            future: provider.cryptoService.fetchCrypto(),
            builder: (context, important) {
              if (important.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (important.hasError) {
                return Text("${important.error}");
              } else if (important.hasData) {
                var modelList = important.data!;
                return ListView.separated(
                    itemBuilder: (context, index) {
                      final model = modelList[index];
                      return ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CryptoMarketDetailScreen(
                                    cryptoModel: model,
                                  ),
                                ));
                          },
                          leading:
                              Image.network(model.image ?? 'No image found'),
                          title: Text(model.name ?? 'No name found'),
                          subtitle: Row(
                            children: [
                              Text(
                                model.marketCapRank!.toStringAsFixed(0),
                                style: const TextStyle(color: Colors.blue),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(model.symbol ?? 'No symbol found'),
                              const SizedBox(
                                width: 7,
                              ),
                            ],
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.currency_rupee,
                                    size: 20,
                                    color: Colors.green,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    model.currentPrice!.toStringAsFixed(0),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                model.marketCap != null
                                    ? '₹${model.marketCap!.toStringAsFixed(2)}'
                                    : 'Market Cap: N/A',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ));
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: modelList.length);
              } else {
                return const Text('No data');
              }
            },
          );
        },
      ),
    );
  }
}
