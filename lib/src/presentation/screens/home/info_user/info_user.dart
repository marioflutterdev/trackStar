import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/data.dart';
import '../../../widgets/widgets.dart';
import '../../auth/update_user/update_user.dart';

class InfoUserDawer extends StatelessWidget {
  const InfoUserDawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = context.watch<LoginAuthProvider>().user?.user.userMetadata;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              height: 100,
              child: Image.asset('assets/img/logo.png'),
            ),
            const Spacer(),
            const BodyUpdateItemCustomWidget(
              icon: Icons.edit,
              color: Colors.tealAccent,
              title: 'Editar Perfil',
              child: BodyFormEditUser(),
            ),
          ],
        ),
        Center(
          child: CircleAvatar(
            radius: 75,
            backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
            child: CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(user?.avatarUrl ?? ''),
              onBackgroundImageError: (exception, stackTrace) =>
                  const AssetImage('assets/img/no-image.jpg') as ImageProvider,
            ),
          ),
        ),
        Text(
          '${user?.firstName} ${user?.lastName}',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Divider(),
        textCustom(user?.phoneNumber, title: 'Celular'),
        textCustom(user?.documentProfile, title: 'Documento'),
        Row(
          children: [
            const Text('Tipo de Usuario: ',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                )),
            user!.superUser
                ? const Text('Administrador')
                : const Text('Colaborador'),
          ],
        ),
        const SizedBox(
          height: 50,
        )
      ],
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
