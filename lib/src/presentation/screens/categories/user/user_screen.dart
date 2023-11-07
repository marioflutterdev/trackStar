import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:skeletonizer/skeletonizer.dart';
import 'package:trackstar_web/src/presentation/widgets/widgets.dart';

import '../../../../config/resposive/responsive_funtion.dart';
import '../../../../data/data.dart';
import 'widgets/body_form_user.dart';
import 'widgets/info_user.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<GetUser>(context);
    final List<UsersGetModel> usersData = userData.users;
    return Stack(
      children: [
        Skeletonizer(
          enabled: userData.loading,
          child: GridView.builder(
            itemCount: usersData.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: responsiveGrip(context),
              mainAxisExtent: 400,
            ),
            itemBuilder: (BuildContext context, int index) {
              return InfoUser(user: usersData[index]);
            },
          ),
        ),
        const Positioned(
          bottom: 30,
          right: 30,
          child: BodyUpdateItemCustomWidget(
            title: 'Añadir Usuario',
            child: BodyFormUser(),
          ),
        )
      ],
    );
  }
}
