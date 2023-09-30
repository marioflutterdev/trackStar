import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackstar_web/src/config/resposive/app_responsive.dart';
import 'package:trackstar_web/src/config/theme/app_theme.dart';
import 'package:trackstar_web/src/presentation/provider/providers.dart';

import 'package:trackstar_web/src/presentation/screens/home/widgets/widgets.dart';

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
          Row(
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
          )
        ],
      ),
    );
  }
}
