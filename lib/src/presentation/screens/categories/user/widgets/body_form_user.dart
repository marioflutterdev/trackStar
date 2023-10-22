import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../config/helpers/alert_auth.dart';
import '../../../../../data/data.dart';
import '../../../../widgets/widgets.dart';

class BodyFormUser extends StatefulWidget {
  const BodyFormUser({super.key});

  @override
  State<BodyFormUser> createState() => _BodyFormUserState();
}

class _BodyFormUserState extends State<BodyFormUser> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController(),
      emailController = TextEditingController(),
      passwordController = TextEditingController(),
      descriptionController = TextEditingController();

  var superUser = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textTitle("Nombre"),
                    FormCustomWidget(
                      controller: nameController,
                      border: 15,
                      hintText: "Nombre",
                    ),
                    textTitle("Correo"),
                    FormCustomWidget(
                      controller: emailController,
                      border: 15,
                      hintText: "Correo",
                      validator: (value) => alertEmail(value, context),
                    ),
                    textTitle("contraseña"),
                    FormCustomWidget(
                      controller: passwordController,
                      obscureText: true,
                      border: 15,
                      hintText: "contraseña",
                    ),
                    textTitle("Super Usuario"),
                    Switch(
                      value: superUser,
                      activeColor: theme.onPrimaryContainer,
                      inactiveThumbColor: theme.background,
                      inactiveTrackColor: Colors.red,
                      onChanged: (value) {
                        setState(() {});
                        superUser = value;
                      },
                    ),
                    textTitle("Descripcion"),
                    FormCustomWidget(
                      controller: descriptionController,
                      border: 15,
                      textExtraLarge: true,
                      hintText: "Descripcion",
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          ChangeNotifierProvider(
            create: (context) => CreatedNewUser(),
            child: Builder(builder: (context) {
              final newUser = context.watch<CreatedNewUser>();
              return SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).colorScheme.onPrimaryContainer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await newUser.createNewUser(
                        nameController.text,
                        emailController.text,
                        passwordController.text,
                        superUser,
                        descriptionController.text,
                      );
                    }
                  },
                  child: newUser.loading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          "Añadir Usuario",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                ),
              );
            }),
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
