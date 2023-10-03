import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackstar_web/src/config/resposive/app_responsive.dart';
import 'package:trackstar_web/src/config/theme/app_theme.dart';
import 'package:trackstar_web/src/presentation/provider/menu_drawer/navegacion_drawer_provider.dart';
import 'package:trackstar_web/src/presentation/provider/providers.dart';

import 'package:trackstar_web/src/presentation/screens/home/widgets/widgets.dart';
import 'package:trackstar_web/src/presentation/screens/screens.dart';

class MenuTotalHome extends StatelessWidget {
  const MenuTotalHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final movile = AppResponsive.isLargeMobile(context);
    final theme = Theme.of(context).colorScheme;
    final providerTheme = context.watch<ThemeProvider>();
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.fromLTRB(
          movile ? 30 : 100, movile ? 30 : 50, 30, movile ? 30 : 50),
      decoration: BoxDecoration(
        color: theme.onSecondaryContainer,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(10, 10),
          )
        ],
      ),
      child: Column(
        children: [
          _ButtonMenu(
            movile: movile,
            providerTheme: providerTheme,
          ),
          Expanded(
            child: Row(
              children: [
                const _CategoriesVIew(),
                if (!movile)
                  Container(
                    width: 400,
                    height: double.infinity,
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 10,
                              color: Colors.black26,
                              offset: Offset(5, 5))
                        ]),
                    child: const Center(
                      child: Text(
                        'soon',
                        style: TextStyle(fontSize: 100),
                      ),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CategoriesVIew extends StatelessWidget {
  const _CategoriesVIew({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final menuController = context.watch<NavegacionDrawerProvider>();
    return Expanded(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                blurRadius: 10,
                color: Colors.black26,
                offset: Offset(5, 5),
              )
            ]),
        child: Center(
            child: PageView(
          controller: menuController.pageController,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            UserScreen(),
            CenterDistribucionScreen(),
            ProductsScreen(),
            EntradasSalidasScreen(),
            SettingsScreen(),
          ],
        )),
      ),
    );
  }
}

class _ButtonMenu extends StatelessWidget {
  const _ButtonMenu({
    super.key,
    required this.movile,
    required this.providerTheme,
  });

  final bool movile;
  final ThemeProvider providerTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (movile) const OpenDrawer(),
        const Expanded(child: SizedBox()),
        ButtonCustomHome(
          icon: providerTheme.themeData == dartMode
              ? Icons.light_mode
              : Icons.dark_mode_outlined,
          onTap: () {
            providerTheme.toggleMode();
          },
        ),
        const LeaveLogin(),
      ],
    );
  }
}
