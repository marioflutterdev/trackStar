import 'package:flutter/material.dart';

import 'package:trackstar_web/src/presentation/screens/home/widgets/widgets.dart';

class MenuTotalHome extends StatelessWidget {
  const MenuTotalHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: const EdgeInsets.fromLTRB(100, 50, 30, 50),
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
      child: const Column(
        children: [
          Row(
            children: [
              Expanded(child: SizedBox()),
              LeaveLogin(),
            ],
          )
        ],
      ),
    );
  }
}
