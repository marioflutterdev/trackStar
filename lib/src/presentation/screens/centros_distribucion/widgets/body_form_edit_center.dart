import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:trackstar_web/src/data/data.dart';

import '../../../../../config/helpers/alert_auth.dart';
import '../../../../widgets/widgets.dart';

class BodyFormEditCenter extends StatefulWidget {
  final CenterModel center;
  const BodyFormEditCenter({
    super.key,
    required this.center,
  });

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
                    textTitle("Dirección"),
                    FormCustomWidget(
                      controller: addressController,
                      border: 15,
                      hintText: "Dirección",
                    ),
                    textTitle("Descripción"),
                    FormCustomWidget(
                      controller: descriptionController,
                      border: 15,
                      hintText: "Direccion",
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          _ButtonSentEditCenter(
            id: widget.center.id,
            formKey: _formKey,
            centerName: nameController,
            address: addressController,
            drescription: descriptionController,
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

class _ButtonSentEditCenter extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String id;
  final TextEditingController centerName;
  final TextEditingController address;
  final TextEditingController drescription;

  const _ButtonSentEditCenter({
    super.key,
    required this.formKey,
    required this.centerName,
    required this.address,
    required this.drescription,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CreatedNewUser(),
      child: Builder(builder: (context) {
        final editCenter = context.watch<EditCenter>();
        final getCenter = context.watch<GetCenterDistribution>();
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
                final userOk = await editCenter.editCenter(
                  center: CenterModel(
                    id: id,
                    nameCenter: centerName.text,
                    addressCenter: address.text,
                    descriptionCenter: drescription.text,
                    avatarUrl: '',
                  ),
                );
                if (context.mounted) {
                  if (userOk) {
                    getCenter.getCenter();
                    Navigator.pop(context);
                  } else {
                    errorAlert(
                      context,
                    );
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
