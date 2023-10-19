import 'package:flutter/material.dart';

import 'package:trackstar_web/src/data/models/categorias/user.dart';
import 'package:trackstar_web/src/presentation/widgets/form_custom.dart';

import 'widgets/info_user.dart';
import '../../home/widgets/widgets.dart';
import '../../../widgets/xencard_custom/xencard_custom.dart';
import '../../../../config/config.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usersData = users;
    final theme = Theme.of(context).colorScheme;
    final table = AppResponsive.isTablet(context);
    final desktop = AppResponsive.isDesktop(context);
    final movile = AppResponsive.isLargeMobile(context);
    return Stack(
      children: [
        GridView.builder(
          itemCount: usersData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: movile
                ? 1
                : table
                    ? 3
                    : desktop
                        ? 4
                        : 4,
            mainAxisExtent: 400,
          ),
          itemBuilder: (BuildContext context, int index) {
            return InfoUser(
              img: usersData[index].imageUrl,
              name: usersData[index].name,
              edad: usersData[index].edad,
              genero: usersData[index].genero,
              descripcion: usersData[index].descripcion,
            );
          },
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: ButtonCustomHome(
            icon: Icons.add,
            onTap: () => showDialog(
              context: context,
              builder: (builder) => XenPopupCard(
                cardBgColor: theme.background,
                appBar: XenCardAppBar(
                  color: theme.background,
                  child: const SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Center(
                      child: FittedBox(
                        child: Text(
                          'Añadir Usuario',
                          style: TextStyle(fontSize: 45),
                        ),
                      ),
                    ),
                  ),
                ),
                body: const _BodyForm(),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _BodyForm extends StatelessWidget {
  const _BodyForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textTitle("Nombre"),
          const FormCustomWidget(
            border: 15,
            hintText: "Nombre",
          ),
          textTitle("Correo"),
          const FormCustomWidget(
            border: 15,
            hintText: "Correo",
          ),
          textTitle("contraseña"),
          const FormCustomWidget(
            obscureText: true,
            border: 15,
            hintText: "contraseña",
          ),
          textTitle("Genero"),
          const FormCustomWidget(
            textExtraLarge: true,
            border: 15,
            hintText: "Genero",
          ),
          textTitle("Descripcion"),
          const FormCustomWidget(
            border: 15,
            textExtraLarge: true,
            hintText: "Descripcion",
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Theme.of(context).colorScheme.onPrimaryContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {
                //TODO: Añadir Usuario
              },
              child: const Text("Añadir Usuario"),
            ),
          ),
        ],
      ),
    );
  }

  Padding textTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(text, style: const TextStyle(fontSize: 20)),
    );
  }
}
