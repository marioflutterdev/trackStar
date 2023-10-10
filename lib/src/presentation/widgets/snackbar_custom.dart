import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SnackbarCustomWidget extends StatelessWidget {
  const SnackbarCustomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.red,
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              const Row(
                children: [
                  SizedBox(width: 48),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '¡Error!',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Revisas tus credenciales ',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 5,
                top: -10,
                child: SvgPicture.asset(
                  'assets/svg/error.svg',
                  height: 30,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 50)
      ],
    );
  }
}
