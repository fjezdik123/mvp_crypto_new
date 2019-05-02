import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvp_crypto/data_models/crypto_model.dart';
import 'package:mvp_crypto/presenters/crypto_presenter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> implements CryptoViewContract {
  CryptoListPresenter _presenter;
  List<Crypto> _currencies;
  bool _isLoading;
  final List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];

  _HomePageState() {
    _presenter = new CryptoListPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _presenter.loadCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Crypto App"),
          elevation: defaultTargetPlatform == TargetPlatform.iOS ? 0.0 : 5.0,
        ),
        body: _isLoading
            ? new Center(
                child: new CircularProgressIndicator(),
              )
            : _cryptoWidget());
  }

  Widget _cryptoWidget() {
    return new Container(
        child: new Column(
      children: <Widget>[
        new Flexible(
          child: new ListView.builder(
            itemCount: _currencies.length,
            itemBuilder: (BuildContext context, int index) {
              //final int i = index ~/ 2;
              final Crypto currency = _currencies[index];
              final MaterialColor color = _colors[index % _colors.length];
              //if (index.isOdd) {
              //   return new Divider();
              // }
              return _getListItemUi(currency, color);
            },
          ),
        )]
    ));
  }

  ListTile _getListItemUi(Crypto currency, MaterialColor color) {
    return new ListTile(
        leading: new Image.network("https://cryptoicons.org/api/icon/" +
            currency.symbol.toLowerCase() +
            "/50"),
        title: new Text(currency.name,
            style: new TextStyle(fontWeight: FontWeight.bold)),
        subtitle: _getSubtitleText(
            currency.priceInUsd, currency.oneHourPercentChange, currency.rank),
        isThreeLine: true);
  }

  Widget _getSubtitleText(String priceUSD, String percentageChange, String rank) {
    TextSpan priceTextWidget = new TextSpan(
        text: "\$$priceUSD\n", style: new TextStyle(color: Colors.black));
    String percentageChangeText = "1 hour: $percentageChange%";
    TextSpan percentageChangeTextWidget;
    TextSpan rankTextWidget;

    if (double.parse(percentageChange) > 0) {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText,
          style: new TextStyle(color: Colors.green));
    } else {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText, style: new TextStyle(color: Colors.red));
    }

    if(rank!=null && rank !=''){
      rankTextWidget = new TextSpan(
          text: "$rank\n", style: new TextStyle(color: Colors.blue));
    }

    return new RichText(
        text: new TextSpan(
            children: [rankTextWidget, priceTextWidget, percentageChangeTextWidget]));
  }

  @override
  void onLoadCryptoComplete(List<Crypto> items) {
   setState(() {
      _currencies = items;
      _isLoading = false;
    });
  }

  @override
  void onLoadError() {
    // TODO: implement onLoadError
  }
}
