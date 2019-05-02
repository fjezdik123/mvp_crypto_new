import 'package:mvp_crypto/data_models/crypto_model.dart';
import 'package:mvp_crypto/common/injector.dart';
import 'package:mvp_crypto/repository_interfaces/crypto_repo_interface.dart';
//notification if downloaded or errors

//contracts-->interfaces
abstract class CryptoViewContract{
  void onLoadCryptoComplete(List<Crypto> cryptoList);
  void onLoadError();

}

class CryptoListPresenter {
  CryptoViewContract _view;
  CryptoRepository _repository;

  CryptoListPresenter(this._view){
    _repository = new Injector().cryptoRepository;
  }

  void loadCurrencies(){
    _repository.fetchCurrencies().then((c)=>_view.onLoadCryptoComplete(c)).catchError((onError)=>_view.onLoadError());
  }
}