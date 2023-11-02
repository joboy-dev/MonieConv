// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:monie_conv/provider/currency_provider.dart';
import 'package:monie_conv/shared/logger.dart';
import 'package:provider/provider.dart';

const host = 'http://api.currencylayer.com';
const accessKey = 'b3942ecb998aa2f52cf9b320386a73bc';

// String accessKey = DotEnv().env['API_KEY']!;

getAllCurrencies(BuildContext context) async {
  Uri uri = Uri.parse('$host/list?access_key=$accessKey');

  try {  
    // make get request
    var response = await http.get(uri);

    // store response data in variable
    var data = jsonDecode(response.body);

    if (data['success'] == true) {
      Map<String, dynamic> currencies = data['currencies'];
      List<String> currencyList = currencies.keys.toList();
      logger(currencyList);

      // store currency map in provider
      context.read<CurrencyProvider>().addCurrencyMap(currencies);
      context.read<CurrencyProvider>().addCurrencies(currencyList);
      return data['currencies'];
    } else {
      return '';
    }
  } catch (e) {
    logger('Exception: ${e.toString()}');
    return null;
  }
}

/// Function for currency conversion
convertCurrency(String from, String to, String amount) async {
  Uri uri = Uri.parse('$host/convert?from=$from&to=$to&amount=$amount&access_key=$accessKey');

  try {
    var response = await http.get(uri);

    var data = jsonDecode(response.body);

    if (data['success'] == true) {
      logger(data);
      double result = data['result'];
      logger(result);
      return result;
    } else {
      return '';
    }
    
  } catch (e) {
    logger('Exception: ${e.toString()}');
    return null;
  }
}