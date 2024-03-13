import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackstar_web/src/config/helpers/alert_auth.dart';

import '../../../../../../data/data.dart';
import '../../../../../widgets/widgets.dart';

class BodyFormAddInventory extends StatefulWidget {
  final ProductsModel product;

  const BodyFormAddInventory({
    super.key,
    required this.product,
  });

  @override
  State<BodyFormAddInventory> createState() => _BodyFormAddInventoryState();
}

class _BodyFormAddInventoryState extends State<BodyFormAddInventory> {
  final _formKey = GlobalKey<FormState>();

  final cantidadController = TextEditingController(),
      precioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final center =
        Provider.of<LoginAuthProvider>(context).user!.user.userMetadata.center;
    final getCenter = Provider.of<GetCenterDistribution>(context);
    final addIventory = Provider.of<NewInventoryItem>(context);
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
                    textTitle("Cantidad"),
                    FormCustomWidget(
                      controller: cantidadController,
                      border: 15,
                      hintText: "cantidad",
                    ),
                    textTitle("Precio"),
                    FormCustomWidget(
                      controller: precioController,
                      border: 15,
                      hintText: "Precio",
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          _ButtonSentNewProduct(
              loading: addIventory.loading,
              title: 'Agregar',
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final createOk = await addIventory.createNewProduct(
                    center: center,
                    nameProduct: widget.product.id,
                    quantity: cantidadController.text,
                    price: precioController.text,
                  );

                  if (context.mounted) {
                    if (createOk) {
                      resetPassaword(context, 'Producto creado correctamente');
                      getCenter.getCenter();
                      Future.delayed(
                        const Duration(milliseconds: 2000),
                        () => Navigator.pop(context),
                      );
                    } else {
                      errorAlertCustom(context: context);
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

class _ButtonSentNewProduct extends StatelessWidget {
  final bool loading;
  final String title;
  final void Function()? onPressed;

  const _ButtonSentNewProduct({
    super.key,
    required this.loading,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
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
        onPressed: onPressed,
        child: loading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
      ),
    );
  }
}
