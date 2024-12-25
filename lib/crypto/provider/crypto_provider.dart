import 'package:api_start_project/crypto/model/crypto_model.dart';
import 'package:api_start_project/crypto/service/crypto_service.dart';
import 'package:flutter/foundation.dart';

class CryptoProvider extends ChangeNotifier {
  List<CryptoModel>? cryptoModel;
  final CryptoService cryptoService;
  CryptoProvider(this.cryptoService);
  bool isLoading = false;

  Future fetchCrypto() async {
    isLoading = true;
    notifyListeners();
    try {
      cryptoModel = await cryptoService.fetchCrypto();
    } catch (e) {
      if (kDebugMode) {
        print('Error to fetch crypto data :$e');
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
