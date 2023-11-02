import 'package:flutter/material.dart';

class CurrencyProvider extends ChangeNotifier {
  final List<String> _currencies = [];
  final Map<String, dynamic> _currencyMap = {};

  List<String> get currencies => _currencies;
  Map<String, dynamic> get currencyMap => _currencyMap;

  void addCurrencies(List<String> currencyList) {
    _currencies.addAll(currencyList);
    notifyListeners();
  }

  void addCurrencyMap(Map<String, dynamic> currencyMap) {
    _currencyMap.addAll(currencyMap);
  }
}