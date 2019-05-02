//repository interface
//abstract as interface
import 'package:mvp_crypto/data_models/crypto_model.dart';

abstract class CryptoRepository{
  Future<List<Crypto>> fetchCurrencies();

}