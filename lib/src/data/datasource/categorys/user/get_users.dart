import 'package:flutter/material.dart';
import 'package:trackstar_web/src/data/models/categorys/user_model/user_model.dart';

import '../../../api/api.dart';

class GetUser extends ChangeNotifier {
  GetUser() {
    getUser();
  }

  bool _loading = true;
  final List<UsersGetModel> _users = [];
  final String accessToken =
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV3anB5dmZ0cW54Z210dnZlaHR5Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5ODE5ODY4OCwiZXhwIjoyMDEzNzc0Njg4fQ.NzGLxrCdoUcR8ABXDCBasPkXxNtWah8Q4OKYUDI0A7Q';

  bool get loading => _loading;

  List<UsersGetModel> get users => _users;
  set loading(bool valor) {
    _loading = valor;
    notifyListeners();
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
