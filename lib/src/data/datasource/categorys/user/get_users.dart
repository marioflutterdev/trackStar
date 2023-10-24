import 'package:flutter/material.dart';
import 'package:trackstar_web/src/data/models/categorias/user_category/user._category.dart';

import '../../../api/api.dart';

class GetUser extends ChangeNotifier {
  GetUser() {
    getUser();
  }

  bool _loading = true;
  final List<UsersGet> _users = [];
  final String accessToken =
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhxZ3dvbXVpaWRyZWRnaG1yZWF3Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5Nzk4OTcyNywiZXhwIjoyMDEzNTY1NzI3fQ.-LzLKOb72oCFAkUSel_TwV92v9wEDknVBIk4Jva_5gs';

  bool get loading => _loading;

  List<UsersGet> get users => _users;
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
        _users.add(UsersGet.fromJson(element));
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
