import 'package:flutter/material.dart';

import '../../../../config/constans/constans.dart';
import '../../../api/api.dart';
import '../../../data.dart';

class GetCenterDistribution extends ChangeNotifier {
  GetCenterDistribution() {
    getProducts();
  }

  bool _loading = true;
  final List<CenterModel> _centerDistribution = [];

  //TODO chage apikey for your apikey
  final String accessToken = 'Bearer $apikey';

  bool get loading => _loading;

  List<CenterModel> get centerDistribution => _centerDistribution;

  set loading(bool valor) {
    _loading = valor;
    notifyListeners();
  }

  Future<void> getProducts() async {
    loading = true;
    _centerDistribution.clear();

    dio.options.headers['Authorization'] = ' $accessToken';

    final res = await dio.get('/rest/v1/center?select=*');
    if (res.statusCode == 200) {
      res.data.forEach((element) {
        _centerDistribution.add(CenterModel.fromJson(element));
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
