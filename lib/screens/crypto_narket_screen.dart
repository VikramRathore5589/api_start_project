import 'package:api_start_project/models/crypto_model.dart';
import 'package:api_start_project/providers/crypto_provider.dart';
import 'package:api_start_project/screens/app_bar_widget.dart';
import 'package:api_start_project/ui_helper/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CryptoMarketScreen extends StatefulWidget {
  const CryptoMarketScreen({super.key});

  @override
  State<CryptoMarketScreen> createState() => _CryptoMarketScreenState();
}

class _CryptoMarketScreenState extends State<CryptoMarketScreen> {
  final uiHelper = UiHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const AppBarWidget(),
      body: Consumer<CryptoProvider>(
        builder: (context, provider, child) {
          return FutureBuilder<List<CryptoModel>>(
              future: provider.uiHelper.fetchCrypto(),
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
                            leading:
                                Image.network(model.image ?? 'No image found'),
                            title: Text(model.name ?? 'No name found'),
                            subtitle: Row(
                              children: [
                                Text(model.athChangePercentage.toString()),
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
                                      model.currentPrice!.toStringAsFixed(2),
                                      style: const TextStyle(
                                        fontSize: 16,
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
                                    fontSize: 14,
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
                  return const Text('No dta');
                }
              });
        },
      ),
    );
  }
}
