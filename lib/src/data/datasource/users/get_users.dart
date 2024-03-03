import 'package:flutter/material.dart';
import 'package:trackstar_web/src/data/models/users_model/users_model.dart';

import '../../../config/constans/constans.dart';
import '../../api/api.dart';

class GetUser extends ChangeNotifier {
  bool _loading = true;
  final List<UsersGetModel> _users = [];

  final String accessToken = 'Bearer $apikey';

  List<UsersGetModel> get users => _users;

  bool get loading => _loading;
  set loading(bool valor) {
    _loading = valor;
    notifyListeners();
  }

  GetUser() {
    getUser();
  }

  Future<void> getUser() async {
    loading = true;
    _users.clear();

    dio.options.headers['Authorization'] = ' $accessToken';

    final res = await dio.get('/rest/v1/profiles?select=*');
    if (res.statusCode == 200) {
      res.data.forEach((element) {
        _users.add(UsersGetModel.fromJson(element));
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
