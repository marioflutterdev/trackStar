import 'package:flutter/material.dart';

import '../../../../../widgets/widgets.dart';

class InfoInventy extends StatelessWidget {
  final String id;
  final String nameProduct;
  final String img;
  final int quantity;
  final int price;

  const InfoInventy({
    Key? key,
    required this.id,
    required this.nameProduct,
    required this.img,
    required this.quantity,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CardInfoCustomWidget(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 75,
                    backgroundColor:
                        Theme.of(context).colorScheme.onPrimaryContainer,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage(img),
                    ),
                  ),
                  Text(
                    nameProduct,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('ID: $id'),
                  Text('Cantidad: $quantity'),
                  Text(
                    'Precio: $price',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
