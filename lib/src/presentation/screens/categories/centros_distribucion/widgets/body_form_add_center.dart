import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:trackstar_web/src/config/helpers/alert_auth.dart';

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
      addressController = TextEditingController(),
      descriptionController = TextEditingController();

  XFile? fileSendData;

  @override
  Widget build(BuildContext context) {
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
                      fileSendData = file;
                      setState(() {});
                    }),
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
                      hintText: "Direccion",
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
            name: nameController,
            address: addressController,
            description: descriptionController,
            avatarUrl: fileSendData,
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
  final XFile? avatarUrl;

  const _ButtonSentNewProduct({
    required GlobalKey<FormState> formKey,
    required this.name,
    required this.description,
    required this.address,
    required this.avatarUrl,
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
              avatarUrl: avatarUrl,
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
