import 'dart:convert';

import 'package:api_start_project/crypto/model/crypto_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class CryptoService {
  List<List<CryptoModel>>? cryptoModel;

  Future<List<CryptoModel>> fetchCrypto() async {
    String url = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=99&page=1&sparkline=false'
        ;
    Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> result = jsonDecode(response.body);
      final finalResult = result.map((e) => CryptoModel.fromJson(e)).toList();
      return finalResult;
    } else {
      throw Exception(['Error to load data']);
    }
  }
}
