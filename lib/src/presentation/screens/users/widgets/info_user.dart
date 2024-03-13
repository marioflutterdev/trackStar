import 'package:flutter/material.dart';
import 'package:trackstar_web/src/data/data.dart';

import '../../../widgets/widgets.dart';

class InfoUser extends StatelessWidget {
  final UsersGetModel user;

  const InfoUser({super.key, required this.user});

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
                  backgroundImage: user.avatarUrl != null
                      ? NetworkImage(user.avatarUrl!)
                      : const AssetImage('assets/img/no-image.jpg')
                          as ImageProvider,
                ),
              ),
              Text(
                '${user.firstName} ${user.lastName}',
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              textCustom(user.email, title: 'Email'),
              textCustom(user.phoneNumber, title: 'Celular'),
              textCustom(user.addressProfile, title: 'Dirección'),
              textCustom(user.documentProfile, title: 'CC'),
              Row(
                children: [
                  user.superUser ?? false
                      ? const Text('Administrador: ')
                      : const Text('Colaborador: '),
                  user.superUser ?? false
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

  Row textCustom(String? value, {String? title}) {
    const TextStyle textStyles = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
    );
    return Row(
      children: [
        Text('$title: ', style: textStyles),
        Text(value ?? 'no data'),
      ],
    );
  }
}
