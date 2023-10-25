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
      emailController = TextEditingController(),
      passwordController = TextEditingController(),
      descriptionController = TextEditingController();

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
  File? fileSendData;

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
            nameController: nameController,
            emailController: emailController,
            passwordController: passwordController,
            superUser: superUser,
            descriptionController: descriptionController,
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
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.superUser,
    required this.descriptionController,
    required this.getUser,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool superUser;
  final TextEditingController descriptionController;
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
                  nameController.text,
                  emailController.text,
                  passwordController.text,
                  superUser,
                  descriptionController.text,
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
