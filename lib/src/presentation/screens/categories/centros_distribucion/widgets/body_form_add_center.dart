import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../../config/helpers/alert_auth.dart';
import '../../../../../data/data.dart';
import '../../../../widgets/widgets.dart';

class BodyFormAddCenter extends StatefulWidget {
  const BodyFormAddCenter({super.key});

  @override
  State<BodyFormAddCenter> createState() => _BodyFormAddCenterState();
}

class _BodyFormAddCenterState extends State<BodyFormAddCenter> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController(),
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
                    textTitle("Descripción"),
                    FormCustomWidget(
                      controller: descriptionController,
                      hintText: "Descripción",
                      textExtraLarge: true,
                      border: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          _ButtonSentNewProduct(
            formKey: _formKey,
            nameController: nameController,
            descriptionController: descriptionController,
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

class _ButtonSentNewProduct extends StatelessWidget {
  final GlobalKey<FormState> _formKey;
  final TextEditingController nameController;
  final TextEditingController descriptionController;

  const _ButtonSentNewProduct({
    required GlobalKey<FormState> formKey,
    required this.nameController,
    required this.descriptionController,
  }) : _formKey = formKey;

  @override
  Widget build(BuildContext context) {
    final newCenter = context.watch<NewCenter>();
    final getCenters = context.watch<GetCenterDistribution>();
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
          print(nameController.text);
          print(descriptionController.text);
          /* if (_formKey.currentState!.validate()) {
            final createOk = await newCenter.createNewCenter(CenterModel(
              id: '',
              nameCenter: nameController.text,
              addressCenter: nameController.text,
              descriptionCenter: '',
              avatarUrl: '',
            ));
            if (context.mounted) {
              resetPassaword(context, 'Producto creado correctamente');
              getCenters.getCenter();
              Future.delayed(
                const Duration(milliseconds: 500),
                () => Navigator.pop(context),
              );
              if (createOk) {
              } else {
                errorAlert(context);
              }
            }
          } */
        },
        child: newCenter.loading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : const Text(
                "Añadir Centro",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
      ),
    );
  }
}
