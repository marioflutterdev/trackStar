import 'package:flutter/material.dart';

import '../../../../config/constans/constans.dart';
import '../../../api/api.dart';
import '../../../data.dart';

class GetCenterDistribution extends ChangeNotifier {
  bool _loading = true;
  final List<CenterModel> _centerDistribution = [];
  final url =
      '/rest/v1/center?select=*,inventory(id,quantity,price,product:id_product(*))';

  //TODO Cambiar el apikey por el de produccion
  final String accessToken = 'Bearer $apikey';

  bool get loading => _loading;

  List<CenterModel> get centerDistribution => _centerDistribution;

  set loading(bool valor) {
    _loading = valor;
    notifyListeners();
  }

  GetCenterDistribution() {
    getCenter();
  }
  Future<void> getCenter() async {
    loading = true;

    _centerDistribution.clear();

    dio.options.headers['Authorization'] = ' $accessToken';

    final res = await dio.get(url);

    if (res.statusCode == 200) {
      res.data.forEach(
        (element) {
          _centerDistribution.add(CenterModel.fromJson(element));
        },
      );

      Future.delayed(
        const Duration(
          seconds: 2,
        ),
        () => loading = false,
      );

      notifyListeners();
    } else {
      loading = false;
    }
  }
}
