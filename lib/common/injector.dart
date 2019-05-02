import 'package:mvp_crypto/repositories/crypto_data_mock.dart';
import 'package:mvp_crypto/repositories/crypto_data_production.dart';
import 'package:mvp_crypto/repository_interfaces/crypto_repo_interface.dart';

enum Environment {MOCK, PROD}

//dependency injection only one instance
class Injector{
  static final Injector _singleton = new Injector._internal();
  static Environment _environment;
  static void configure(Environment environment) {
    _environment = environment;
  }

  factory Injector() => _singleton;

  Injector._internal();
  CryptoRepository get cryptoRepository {
    switch (_environment) {
      case Environment.MOCK:
        return new MockCryptoRepository();
      default:
        return new ProdCryptoRepository();
    }
  }
}