import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:trackstar_web/src/config/helpers/alert_auth.dart';
import 'package:trackstar_web/src/presentation/screens/categories/info_centros_distribucion/inventario_centro/widgets/search_product.dart';

import '../../../../../../data/data.dart';
import '../../../../../widgets/widgets.dart';
import '../../../../home/menu_total/menu_total_home.dart';
import '../../../productos/products_screen.dart';

class BodyFormAddInventory extends StatefulWidget {
  const BodyFormAddInventory({super.key});

  @override
  State<BodyFormAddInventory> createState() => _BodyFormAddInventoryState();
}

class _BodyFormAddInventoryState extends State<BodyFormAddInventory> {
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
                    const SearchProductsView(),
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.red,
                    ),
                    textTitle("cantidad"),
                    FormCustomWidget(
                      controller: addressController,
                      border: 15,
                      hintText: "cantidad",
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          _ButtonSentNewProduct(
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

class _ButtonSentNewProduct extends StatelessWidget {
  final GlobalKey<FormState> _formKey;
  final TextEditingController name;
  final TextEditingController description;
  final TextEditingController address;

  const _ButtonSentNewProduct({
    required GlobalKey<FormState> formKey,
    required this.name,
    required this.description,
    required this.address,
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
          if (_formKey.currentState!.validate()) {
            final createOk = await newCenter.createNewCenter(
              name: name.text,
              address: address.text,
              description: description.text,
            );
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
