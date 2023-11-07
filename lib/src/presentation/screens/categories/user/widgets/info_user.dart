import 'package:flutter/material.dart';

import '../../../../widgets/widgets.dart';

class InfoUser extends StatelessWidget {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String direccion;
  final String documento;
  final dynamic avatarUrl;
  final String numCel;
  final bool superUser;

  const InfoUser({
    Key? key,
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.direccion,
    required this.documento,
    required this.avatarUrl,
    required this.numCel,
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
                  backgroundImage: NetworkImage(avatarUrl),
                ),
              ),
              Text(
                '$firstName $lastName',
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              textCustom(id, title: 'ID'),
              textCustom(email, title: 'Email'),
              textCustom(numCel, title: 'Celular'),
              textCustom(direccion, title: 'Direccion'),
              textCustom(documento, title: 'CC'),
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

  Row textCustom(String value, {String? title}) {
    const TextStyle textStyles = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
    );
    return Row(
      children: [
        Text('$title: ', style: textStyles),
        Text(value),
      ],
    );
  }
}
