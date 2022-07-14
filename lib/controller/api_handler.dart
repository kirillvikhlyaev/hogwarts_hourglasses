import 'dart:convert';
import 'dart:developer';

import 'package:hogwarts_hourglasses/core/constants.dart';
import 'package:hogwarts_hourglasses/models/hourglass_model.dart';
import 'package:hogwarts_hourglasses/models/info.dart';
import 'package:http/http.dart' as http;

class ApiHandler {
  // # GET #
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

  // # PUT #
  void updateData(HourglassModel house) {
    var url = Uri.parse('${Names.apiUrl}/houses/${house.id}');
    log('URL: $url');
    var jsonBody = house.toJSON();
    log('JSONBODY: $jsonBody');

    http.put(url, body: jsonEncode(jsonBody)).then((result) =>
        log('Передача завершена: ${result.body} - ${result.statusCode}'));
  }

  // # GET #
  Future<List<Info>> fetchStats() async {
    var url = Uri.parse('${Names.apiUrl}/X-Dumbledore-Mode');
    var responce = await http.get(url);

    if (responce.statusCode == 200) {
      final jsonBody = jsonDecode(responce.body);
      log(jsonBody.toString());
      return (jsonBody as List).map((info) => Info.fromJSON(info)).toList();
    } else {
      throw Exception('Ошибка получения статистики: ${responce.statusCode}');
    }
  }

  // # POST #
  void addStats(Info info) async {
    var url = Uri.parse('${Names.apiUrl}/X-Dumbledore-Mode');
    log('URL $url');
    var jsonBody = info.toJSON();
    log('JSONBODY: $jsonBody');
    http.post(url, body: jsonEncode(jsonBody));
  }

  Future<Info> getStatById(String id) async {
    var url = Uri.parse('${Names.apiUrl}/X-Dumbledore-Mode/$id');
    log('URL: $url');
    var responce = await http.get(url);

    if (responce.statusCode == 200) {
      final jsonBody = jsonDecode(responce.body);
      return Info.fromJSON(jsonBody);
    } else {
      throw Exception('Ошибка получения статистики: ${responce.statusCode}');
    }
  }
}
