import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:trackstar_web/src/presentation/screens/categories/centros_distribucion/widgets/info_centros.dart';

import '../../../../config/resposive/responsive_funtion.dart';
import '../../../../data/data.dart';
import '../../../widgets/widgets.dart';
import '../user/widgets/body_form_user.dart';

class CenterDistribucionScreen extends StatefulWidget {
  const CenterDistribucionScreen({Key? key}) : super(key: key);

  @override
  State<CenterDistribucionScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<CenterDistribucionScreen> {
  @override
  Widget build(BuildContext context) {
    final centerData = Provider.of<GetCenterDistribution>(context);
    final List<CenterModel> usersData = centerData.centerDistribution;
    return Stack(
      children: [
        Skeletonizer(
          enabled: centerData.loading,
          child: GridView.builder(
            itemCount: usersData.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: responsiveGrip(context),
              mainAxisExtent: 400,
            ),
            itemBuilder: (BuildContext context, int index) {
              return InfoCenter(
                center: usersData[index],
              );
            },
          ),
        ),
        const Positioned(
          bottom: 30,
          right: 30,
          child: BodyUpdateItemCustomWidget(
            title: 'Agregar Centro de Distribución',
            //TODO agregar el formulario de agregar centro de distribución
            child: BodyFormUser(),
          ),
        )
      ],
    );
  }
}
