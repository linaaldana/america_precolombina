import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _InfoProvider {
  List<dynamic> info = [];

  Future<List<dynamic>> cargarData(String cultura) async {
    final resp = await rootBundle.loadString('data/info_culturas.json');
    Map dataJson = json.decode(resp);
    info = dataJson[cultura];
    return info;
  }
}

final infoProvider = new _InfoProvider();
