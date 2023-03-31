import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

import '../models/bid_ask_model.dart';

class BidAskRepo {
  final startDate = DateFormat('yyyy-MM-dd').format(
    DateTime(DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day - 30));
  
  final endDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  Future<List<BidAskModel>> getBidAskRates(String currency) async {
    String endpoint = 'https://api.nbp.pl/api/exchangerates/rates/c/$currency/$startDate/$endDate?format=json';

    Response response = await get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      final List bidAskResult = jsonDecode(response.body)['rates'];
      return bidAskResult.map((e) => BidAskModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
