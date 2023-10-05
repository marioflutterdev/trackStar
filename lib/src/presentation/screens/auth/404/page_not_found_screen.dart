import 'package:flutter/material.dart';
import 'package:trackstar_web/src/presentation/widgets/widgets.dart';

class PageNotFoundScreen extends StatelessWidget {
  const PageNotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          BackGroundAuth(
            svgRoute: 'assets/svg/404.svg',
          ),
          Center(
            child: Text(
              'Page Not Found',
              style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
