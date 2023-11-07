import 'dart:html';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
      lastNameController = TextEditingController(),
      addressController = TextEditingController(),
      documentUser = TextEditingController(),
      numTelefonoController = TextEditingController(),
      emailController = TextEditingController(),
      passwordController = TextEditingController();

  bool superUser = false;

  _seletImage() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      final webImage = await image.readAsBytes();
      newPictureFile = webImage;
      setState(() {});
    }
  }

  Uint8List? newPictureFile = Uint8List(8);

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
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: newPictureFile != null
                          ? Image.memory(newPictureFile!).image
                          : null,
                      backgroundColor: newPictureFile != null
                          ? theme.onPrimaryContainer
                          : null,
                      child: IconButton(
                        onPressed: () {
                          _seletImage();
                        },
                        icon: const Icon(Icons.add_a_photo),
                        color: Colors.white,
                      ),
                    ),
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
                    textTitle("Administrador"),
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
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          _ButtonSentNewUser(
            formKey: _formKey,
            name: nameController.text,
            lastName: lastNameController.text,
            address: addressController.text,
            documentUser: documentUser.text,
            numUser: numTelefonoController.text,
            email: emailController.text,
            password: passwordController.text,
            superUser: superUser,
            getUser: getUser,
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
  const _ButtonSentNewUser({
    required GlobalKey<FormState> formKey,
    required this.getUser,
    required this.name,
    required this.lastName,
    required this.address,
    required this.documentUser,
    required this.numUser,
    required this.email,
    required this.password,
    required this.superUser,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final String name;
  final String lastName;
  final String address;
  final String documentUser;
  final String numUser;
  final String email;
  final String password;
  final bool superUser;
  final GetUser getUser;

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
              if (_formKey.currentState!.validate()) {
                final userOk = await createUser.createNewUser(
                  name: name,
                  lastName: lastName,
                  address: address,
                  documentUser: documentUser,
                  numUser: numUser,
                  email: email,
                  password: password,
                  superUser: superUser,
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
