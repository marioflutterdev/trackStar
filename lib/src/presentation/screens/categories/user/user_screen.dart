import 'dart:html';

import 'package:flutter/material.dart';

import 'package:skeletonizer/skeletonizer.dart';
import 'package:trackstar_web/src/data/models/categorias/user_category/user._category.dart';

import '../../../../config/config.dart';
import '../../../widgets/xencard_custom/xencard_custom.dart';
import '../../home/widgets/widgets.dart';
import 'widgets/body_form_user.dart';
import 'widgets/info_user.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<UsersGet> usersData = [
      UsersGet(
        id: '123',
        fullName: 'Mario Steven Melo Mendoza',
        email: 'mario@google.com',
        superUser: true,
        descriptionUser: 'fdas',
        avatarUrl:
            'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png',
      ),
      UsersGet(
        id: '123',
        fullName: 'Adamarys rodriguez',
        email: 'ada@google.com',
        superUser: false,
        descriptionUser: 'no Importa',
        avatarUrl:
            'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png',
      ),
    ];
    final theme = Theme.of(context).colorScheme;
    final table = AppResponsive.isTablet(context);
    final desktop = AppResponsive.isDesktop(context);
    final movile = AppResponsive.isLargeMobile(context);
    return Stack(
      children: [
        Skeletonizer(
          enabled: true,
          child: GridView.builder(
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
                img: usersData[index].avatarUrl,
                id: usersData[index].id,
                name: usersData[index].fullName!,
                superUser: usersData[index].superUser,
              );
            },
          ),
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: ButtonCustomHome(
            icon: Icons.add,
            onTap: () => showDialog(
              context: context,
              builder: (builder) => ScaffoldMessenger(
                child: Builder(
                  builder: (context) => Scaffold(
                    backgroundColor: Colors.transparent,
                    body: XenPopupCard(
                      cardBgColor: theme.background,
                      appBar: XenCardAppBar(
                        color: theme.background,
                        child: SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: Row(
                            children: [
                              const Center(
                                child: FittedBox(
                                  child: Text(
                                    'Añadir Usuario',
                                    style: TextStyle(fontSize: 45),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.close),
                              ),
                            ],
                          ),
                        ),
                      ),
                      body: const BodyFormUser(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
