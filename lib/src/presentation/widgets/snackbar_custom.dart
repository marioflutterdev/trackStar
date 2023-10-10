import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SnackbarCustomWidget extends StatelessWidget {
  final Color? color;
  final String erroText;
  final String sudErroloText;
  final String svg;

  const SnackbarCustomWidget({
    super.key,
    this.color = Colors.red,
    this.erroText = '¡Error!',
    this.sudErroloText = 'Revisas tus credenciales',
    this.svg = 'assets/svg/error.svg',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color,
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                children: [
                  const SizedBox(width: 48),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          erroText,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          sudErroloText,
                          style: const TextStyle(
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
                  svg,
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
