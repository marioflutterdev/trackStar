import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../config/helpers/alert_auth.dart';
import '../../../../data/data.dart';
import '../../../widgets/widgets.dart';

class BodyFormAddUser extends StatefulWidget {
  const BodyFormAddUser({super.key});

  @override
  State<BodyFormAddUser> createState() => _BodyFormAddUserState();
}

class _BodyFormAddUserState extends State<BodyFormAddUser> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController(),
      lastNameController = TextEditingController(),
      addressController = TextEditingController(),
      documentUser = TextEditingController(),
      numTelefonoController = TextEditingController(),
      emailController = TextEditingController(),
      passwordController = TextEditingController();

  bool superUser = false;

  XFile? _imageFile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final getUser = context.watch<GetUser>();

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
                    textTitle("Imagen"),
                    ImagenAvatar(onChangeDate: (file) {
                      _imageFile = file;
                      setState(() {});
                    }),
                    const SizedBox(height: 15),
                    textTitle("Nombres"),
                    FormCustomWidget(
                      controller: nameController,
                      maxLines: 30,
                      border: 15,
                      hintText: "Nombres",
                    ),
                    textTitle("Apellidos"),
                    FormCustomWidget(
                      maxLines: 30,
                      controller: lastNameController,
                      border: 15,
                      hintText: "Apellidos",
                    ),
                    textTitle("Dirección"),
                    FormCustomWidget(
                      maxLines: 45,
                      controller: addressController,
                      border: 15,
                      hintText: "Dirección",
                    ),
                    textTitle("Documento"),
                    FormCustomWidget(
                      maxLines: 10,
                      controller: documentUser,
                      keyboardType: TextInputType.number,
                      border: 15,
                      validator: (value) => soloNumeros(value),
                      hintText: "Documento",
                    ),
                    textTitle("Numero De Telefono"),
                    FormCustomWidget(
                      maxLines: 10,
                      controller: numTelefonoController,
                      border: 15,
                      hintText: "Numero De Telefono",
                      validator: (value) => soloNumeros(value),
                    ),
                    textTitle("Correo"),
                    FormCustomWidget(
                      controller: emailController,
                      border: 15,
                      hintText: "Correo",
                      validator: (value) => alertEmail(value, context),
                    ),
                    textTitle("Contraseña"),
                    FormCustomWidget(
                      controller: passwordController,
                      obscureText: true,
                      border: 15,
                      hintText: "contraseña",
                    ),
                    textTitle("Tipo De Usuario"),
                    Row(
                      children: [
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
                        const SizedBox(width: 10),
                        superUser
                            ? const Text(
                                "Administrador",
                                style: TextStyle(fontSize: 15),
                              )
                            : const Text(
                                "Empleado",
                                style: TextStyle(fontSize: 15),
                              ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          _ButtonSentNewUser(
            formKey: _formKey,
            dataUser: UsersGetModel(
              id: "",
              email: emailController.text,
              firstName: nameController.text,
              lastName: lastNameController.text,
              addressProfile: addressController.text,
              documentProfile: documentUser.text,
              avatarUrl: "",
              phoneNumber: numTelefonoController.text,
              superUser: superUser,
            ),
            path: _imageFile,
            getUser: getUser,
            password: passwordController.text,
          )
          // const SizedBox(height: 15,
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

class _ButtonSentNewUser extends StatelessWidget {
  final String password;
  final GlobalKey<FormState> formKey;
  final UsersGetModel dataUser;
  final GetUser getUser;
  final XFile? path;

  const _ButtonSentNewUser({
    super.key,
    required this.formKey,
    required this.dataUser,
    required this.getUser,
    required this.password,
    this.path,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CreatedNewUser(),
      child: Builder(builder: (context) {
        final createUser = context.watch<CreatedNewUser>();
        return SizedBox(
          height: 40,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                final userOk = await createUser.createNewUser(
                  dataUser: dataUser,
                  password: password,
                  path: path,
                );
                if (context.mounted) {
                  if (userOk) {
                    getUser.getUser();
                    Navigator.pop(context);
                  } else {
                    errorAlert(
                      context,
                    );
                  }
                }
              }
            },
            child: createUser.loading
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
    );
  }
}
