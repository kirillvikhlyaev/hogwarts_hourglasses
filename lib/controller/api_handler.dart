import 'dart:convert';
import 'dart:developer';

import 'package:hogwarts_hourglasses/core/constants.dart';
import 'package:hogwarts_hourglasses/models/hourglass_model.dart';
import 'package:hogwarts_hourglasses/models/info.dart';
import 'package:http/http.dart' as http;

class ApiHandler {
  Future<List<HourglassModel>> fetchData() async {
    var url = Uri.parse('${Names.apiUrl}/houses');
    var responce = await http.get(url);

    if (responce.statusCode == 200) {
      final jsonList = jsonDecode(responce.body);
      return (jsonList as List)
          .map((house) => HourglassModel.fromJSON(house))
          .toList();
    } else {
      throw Exception('Ошибка подключения: ${responce.statusCode}');
    }
  }

  void updateData(HourglassModel house) {
    var url = Uri.parse('${Names.apiUrl}/houses/${house.id}');
    log('URL: $url');
    var jsonBody = house.toJSON();
    log('JSONBODY: $jsonBody');

    http.put(url, body: jsonEncode(jsonBody)).then((result) =>
        log('Передача завершена: ${result.body} - ${result.statusCode}'));
  }

  Future<Info> fetchStats() async {
    var url = Uri.parse('${Names.apiUrl}/X-Dumbledore-Mode');
    var responce = await http.get(url);

    if (responce.statusCode == 200) {
      final jsonBody = jsonDecode(responce.body);
      Info info = Info.fromJSON(jsonBody);
      return info;
    } else {
      throw Exception('Ошибка получения статистики: ${responce.statusCode}');
    }
  }
}
