import 'package:flutter/material.dart';

import '../../../../widgets/widgets.dart';

class InfoUser extends StatelessWidget {
  final String id;
  final String name;
  final String img;
  final bool superUser;

  const InfoUser({
    Key? key,
    required this.img,
    required this.name,
    required this.id,
    required this.superUser,
  }) : super(key: key);

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
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(img),
                ),
              ),
              Text(name),
              Text('ID: $id'),
              Row(
                children: [
                  const Text('Adaministrador: '),
                  superUser
                      ? const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        )
                      : Icon(
                          Icons.cancel,
                          color: Theme.of(context).colorScheme.error,
                        ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
