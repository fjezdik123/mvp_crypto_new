//production data
import 'dart:async';
import 'package:mvp_crypto/data_models/crypto_model.dart';
import 'package:mvp_crypto/common/error.dart';
import 'package:mvp_crypto/repository_interfaces/crypto_repo_interface.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProdCryptoRepository implements CryptoRepository{
  static const String cryptoUrl = "https://api.coinmarketcap.com/v1/ticker/?limit=50";
  @override
  // real data
  Future<List<Crypto>> fetchCurrencies() async {
    http.Response response = await http.get(cryptoUrl);
    final List responseBody = json.decode(response.body);
    final statusCode = response.statusCode;
    if (statusCode != 200 || responseBody == null) {
      throw new FetchDataException(
          "An error ocurred : [Status Code : $statusCode]");
    }
    //mapping created in crypto class
    return responseBody.map((c) => new Crypto.fromMap( c)).toList();
  }

}