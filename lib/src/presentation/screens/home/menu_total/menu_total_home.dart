import 'package:flutter/material.dart';
import 'package:trackstar_web/src/config/resposive/app_responsive.dart';

import 'package:trackstar_web/src/presentation/screens/home/widgets/widgets.dart';

class MenuTotalHome extends StatelessWidget {
  const MenuTotalHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final movile = AppResponsive.isLargeMobile(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.fromLTRB(
          movile ? 30 : 100, movile ? 30 : 50, 30, movile ? 30 : 50),
      decoration: BoxDecoration(
        color: Colors.white,
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
              if (movile)
                ElevatedButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    child: const Icon(Icons.abc)),
              const Expanded(child: SizedBox()),
              const LeaveLogin(),
            ],
          )
        ],
      ),
    );
  }
}
