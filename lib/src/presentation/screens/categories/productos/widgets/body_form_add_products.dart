import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../../config/helpers/alert_auth.dart';
import '../../../../../data/data.dart';
import '../../../../widgets/widgets.dart';

class BodyFormAddProducts extends StatefulWidget {
  const BodyFormAddProducts({super.key});

  @override
  State<BodyFormAddProducts> createState() => _BodyFormAddProductsState();
}

class _BodyFormAddProductsState extends State<BodyFormAddProducts> {
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
  const _ButtonSentNewProduct({
    required GlobalKey<FormState> formKey,
    required this.nameController,
    required this.descriptionController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController nameController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    final newProduct = context.watch<NewProduct>();
    final getProducts = context.watch<GetProducts>();
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
            final createOk = await newProduct.createNewProduct(
              nameController.text,
              descriptionController.text,
            );
            if (context.mounted) {
              resetPassaword(context, 'Producto creado correctamente');
              getProducts.getProducts();
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
        child: newProduct.loading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : const Text(
                "Añadir producto",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
      ),
    );
  }
}
