import 'package:flutter/material.dart';
import 'package:trackstar_web/src/data/data.dart';

import '../../../../config/constans/constans.dart';
import '../../../api/api.dart';

class GetInventory extends ChangeNotifier {
  bool _loading = true;
  final List<InventoryModel> _inventory = [];

  //TODO chage apikey for your apikey
  final String accessToken = 'Bearer $apikey';

  bool get loading => _loading;

  List<InventoryModel> get inventory => _inventory;

  set loading(bool valor) {
    _loading = valor;
    notifyListeners();
  }

  Future<void> getInventory(String idCenter) async {
    loading = true;
    _inventory.clear();

    dio.options.headers['Authorization'] = ' $accessToken';

    final res =
        await dio.get('/rest/v1/inventory?id_center=eq.$idCenter&select=*');
    if (res.statusCode == 200) {
      print(res.data);
      res.data.forEach((element) {
        _inventory.add(InventoryModel.fromJson(element));
      });
      Future.delayed(
          const Duration(
            seconds: 2,
          ),
          () => loading = false);

      notifyListeners();
    } else {
      loading = false;
    }
  }
}
