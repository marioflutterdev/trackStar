import 'package:flutter/material.dart';

import 'package:trackstar_web/src/data/models/categorias/user.dart';
import '../../../../config/config.dart';
import 'widgets/info_user.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usersData = users;
    final table = AppResponsive.isTablet(context);
    final desktop = AppResponsive.isDesktop(context);
    final movile = AppResponsive.isLargeMobile(context);
    return GridView.builder(
      itemCount: usersData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: movile
            ? 1
            : table
                ? 3
                : desktop
                    ? 4
                    : 4,
        mainAxisExtent: 400,
      ),
      itemBuilder: (BuildContext context, int index) {
        return InfoUser(
          img: usersData[index].imageUrl,
          name: usersData[index].name,
          edad: usersData[index].edad,
          genero: usersData[index].genero,
          descripcion: usersData[index].descripcion,
        );
      },
    );
  }
}
