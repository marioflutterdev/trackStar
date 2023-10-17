import 'package:flutter/material.dart';

import '../../../../config/config.dart';
import 'widgets/info-centros.dart';

class CenterDistribucionScreen extends StatelessWidget {
  const CenterDistribucionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final table = AppResponsive.isTablet(context);
    final desktop = AppResponsive.isDesktop(context);
    final movile = AppResponsive.isLargeMobile(context);
    return GridView.builder(
      itemCount: 10,
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
        return const InfoCenter();
      },
    );
  }
}
