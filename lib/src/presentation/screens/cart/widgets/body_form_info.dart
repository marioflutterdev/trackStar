import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackstar_web/src/config/helpers/alert_auth.dart';

import '../../../../data/data.dart';
import '../../../widgets/widgets.dart';

class BodyFormAddCart extends StatefulWidget {
  final String product;

  const BodyFormAddCart({
    super.key,
    required this.product,
  });

  @override
  State<BodyFormAddCart> createState() => _BodyFormAddCartState();
}

class _BodyFormAddCartState extends State<BodyFormAddCart> {
  final _formKey = GlobalKey<FormState>();

  final cantidadController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final center =
        Provider.of<LoginAuthProvider>(context).user!.user.userMetadata.center;
    final addCart = Provider.of<NewCartItem>(context);
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
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          ButtonSentNewItem(
              loading: addCart.loading,
              title: 'Agregar',
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final createOk = await addCart.createNewProduct(
                    center: center,
                    nameProduct: widget.product,
                    quantity: cantidadController.text,
                  );

                  if (context.mounted) {
                    if (createOk) {
                      resetPassaword(context, 'Producto creado correctamente');
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
