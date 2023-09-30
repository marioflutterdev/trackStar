import 'package:flutter/material.dart';
import 'package:trackstar_web/src/presentation/screens/home/widgets/widgets.dart';

class OpenDrawer extends StatelessWidget {
  const OpenDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonCustomHome(
      icon: Icons.menu_open,
      onTap: () => Scaffold.of(context).openDrawer(),
    );
  }
}
