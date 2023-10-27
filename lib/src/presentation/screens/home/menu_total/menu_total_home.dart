import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../../config/config.dart';
import '../../../../config/theme/app_theme.dart';
import '../../../provider/providers.dart';
import '../../screens.dart';
import '../widgets/widgets.dart';

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
          movile ? 15 : 100, movile ? 15 : 15, 15, movile ? 15 : 50),
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
          const _CategoriesView()
        ],
      ),
    );
  }
}

class _CategoriesView extends StatelessWidget {
  const _CategoriesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final menuController = context.watch<NavegacionDrawerProvider>();
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(15),
        child: PageView(
          controller: menuController.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            UserScreen(),
            ProductsScreen(),
            CenterDistribucionScreen(),
            SettingsScreen(),
          ],
        ),
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
    final nameCategoria = context.watch<NavegacionDrawerProvider>();
    return Row(
      children: [
        if (movile) const OpenDrawer(),
        if (!movile)
          const SizedBox(
            width: 15,
          ),
        Expanded(
            child: !movile
                ? Center(
                    child: Text(
                      nameCategoria.nombreCategoria,
                      style: const TextStyle(fontSize: 60),
                    ),
                  )
                : const SizedBox()),
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
