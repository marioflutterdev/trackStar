import 'package:flutter/material.dart';

import '../../../../widgets/widgets.dart';

class InfoProducts extends StatelessWidget {
  const InfoProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CardInfoCustomWidget(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 75,
                backgroundColor:
                    Theme.of(context).colorScheme.onPrimaryContainer,
                child: const CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPYj-P5N6h6pKiQ294t6HM0N8TveV15NfS6csUVtp_&s'),
                ),
              ),
              const Text('ID: 54642'),
              const Text('Nombre: Arroz'),
              const Text(
                  'Descripción: Nisi eiusmod nostrud eu elit adipisicing esse qui est aliqua eu proident et sit. Exercitation ipsum ea ea irure consectetur do aliqua cillum proident consectetur nostrud.')
            ],
          ),
        ),
      ),
    );
  }
}
