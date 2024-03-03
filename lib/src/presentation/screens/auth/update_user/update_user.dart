import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../config/helpers/alert_auth.dart';
import '../../../../data/data.dart';
import '../../../widgets/widgets.dart';

class BodyFormEditUser extends StatefulWidget {
  const BodyFormEditUser({super.key});

  @override
  State<BodyFormEditUser> createState() => _BodyFormEditUserState();
}

class _BodyFormEditUserState extends State<BodyFormEditUser> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController(),
      lastNameController = TextEditingController(),
      addressController = TextEditingController(),
      documentUser = TextEditingController(),
      numTelefonoController = TextEditingController(),
      emailController = TextEditingController(),
      passwordController = TextEditingController();

  XFile? _imageFile;

  @override
  Widget build(BuildContext context) {
    final uploadUser = context.watch<UploadUser>();

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
                      border: 15,
                      hintText: "Nombres",
                    ),
                    textTitle("Apellidos"),
                    FormCustomWidget(
                      controller: lastNameController,
                      border: 15,
                      hintText: "Apellidos",
                    ),
                    textTitle("Direccion"),
                    FormCustomWidget(
                      controller: addressController,
                      border: 15,
                      hintText: "Direccion",
                    ),
                    textTitle("Documento"),
                    FormCustomWidget(
                      controller: documentUser,
                      border: 15,
                      hintText: "Documento",
                    ),
                    textTitle("Numero De Telefono"),
                    FormCustomWidget(
                      controller: numTelefonoController,
                      border: 15,
                      hintText: "Numero De Telefono",
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
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          ButtonSentNewItem(
              loading: uploadUser.loading,
              title: 'Actualizar',
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final createOk = await uploadUser.uploadUser(
                    dataUser: UsersGetModel(
                      email: emailController.text,
                      firstName: nameController.text,
                      lastName: lastNameController.text,
                      addressProfile: addressController.text,
                      documentProfile: documentUser.text,
                      phoneNumber: numTelefonoController.text,
                    ),
                    password: passwordController.text,
                    token: context.read<LoginAuthProvider>().user!.accessToken,
                    path: _imageFile,
                  );
                  if (context.mounted) {
                    if (createOk) {
                      resetPassaword(context, 'Actualizado correctamente');
                      Future.delayed(
                        const Duration(milliseconds: 2000),
                        () => Navigator.pop(context),
                      );
                    } else {
                      errorAlert(context);
                    }
                  }
                }
              })
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
