import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

import '../models/mid_model.dart';

class MidRepo {
  final startDate = DateFormat('yyyy-MM-dd').format(
    DateTime(DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day - 30));
  
  final endDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  Future<List<MidModel>> getMidRates(String currency) async {
    String endpoint = 'https://api.nbp.pl/api/exchangerates/rates/a/$currency/$startDate/$endDate?format=json';

    Response response = await get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      final List midResult = jsonDecode(response.body)['rates'];
      return midResult.map((e) => MidModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
