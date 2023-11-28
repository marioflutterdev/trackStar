import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:trackstar_web/src/config/helpers/alert_auth.dart';

import '../../../../../data/data.dart';
import '../../../../widgets/widgets.dart';

class BodyFormEditCenter extends StatefulWidget {
  const BodyFormEditCenter({super.key});

  @override
  State<BodyFormEditCenter> createState() => _BodyFormEditCenterState();
}

class _BodyFormEditCenterState extends State<BodyFormEditCenter> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController(),
      addressController = TextEditingController(),
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
                    textTitle("Direccion"),
                    FormCustomWidget(
                      controller: addressController,
                      border: 15,
                      hintText: "Description",
                    ),
                    textTitle("Direccion"),
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
          _ButtonSentEditProduct(
            formKey: _formKey,
            name: nameController,
            address: addressController,
            description: descriptionController,
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

class _ButtonSentEditProduct extends StatelessWidget {
  final GlobalKey<FormState> _formKey;
  final TextEditingController name;
  final TextEditingController description;
  final TextEditingController address;

  const _ButtonSentEditProduct({
    required GlobalKey<FormState> formKey,
    required this.name,
    required this.description,
    required this.address,
  }) : _formKey = formKey;

  @override
  Widget build(BuildContext context) {
    final editCenter = context.watch<EditCenter>();
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
          if (_formKey.currentState!.validate()) {
            final createOk = await editCenter.editCenter();
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
          }
        },
        child: editCenter.loading
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
