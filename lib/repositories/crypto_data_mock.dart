//Mock repo for testing
import 'dart:async';
import 'package:mvp_crypto/data_models/crypto_model.dart';
import 'package:mvp_crypto/repository_interfaces/crypto_repo_interface.dart';


//mock
List<Crypto> currenciesMock = <Crypto>[
  new Crypto(name: "Bitcoin",rank:"1", priceInUsd: "800.60", oneHourPercentChange: "-0.7", symbol:"BTC"),
  new Crypto(name: "Ethereum",rank:"2", priceInUsd: "650.30", oneHourPercentChange: "0.85",symbol:"ETH"),
  new Crypto(name: "Ripple",rank:"3", priceInUsd: "300.00", oneHourPercentChange: "-0.25",symbol: "XRP")
];

class MockCryptoRepository implements CryptoRepository {
  @override
  Future<List<Crypto>> fetchCurrencies() => new Future.value(currenciesMock);
}