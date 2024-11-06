import 'package:api_start_project/models/crypto_model.dart';
import 'package:api_start_project/ui_helper/ui_helper.dart';
import 'package:flutter/foundation.dart';

class CryptoProvider extends ChangeNotifier {
  List<CryptoModel>? cryptoModel;
  final uiHelper = UiHelper();
  bool isLoading = false;

  Future fetchCrypto() async {
    isLoading = true;
    notifyListeners();
    try {
      cryptoModel = await uiHelper.fetchCrypto();
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
