import 'package:api_start_project/crypto/provider/crypto_provider.dart';
import 'package:api_start_project/crypto/screen/crypto_market_screen.dart';
import 'package:api_start_project/crypto/service/crypto_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CryptoProvider(CryptoService()),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CryptoMarketScreen(),
      ),
    );
  }
}
