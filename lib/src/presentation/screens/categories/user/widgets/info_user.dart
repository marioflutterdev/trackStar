import 'package:flutter/material.dart';

import '../../../../widgets/widgets.dart';

class InfoUser extends StatelessWidget {
  const InfoUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardInfoCustomWidget(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Positioned(
              top: 5,
              child: CircleAvatar(
                radius: 75,
                backgroundColor:
                    Theme.of(context).colorScheme.onPrimaryContainer,
                child: const CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cGVyc29uYXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80'),
                ),
              ),
            ),
            const Text('ID: 54642'),
            const Text('Nombre: David'),
            const Text(
                'Descripción: Nisi eiusmod nostrud eu elit adipisicing esse qui est aliqua eu proident et sit. Exercitation ipsum ea ea irure consectetur do aliqua cillum proident consectetur nostrud.')
          ],
        ),
      ),
    );
  }
}
