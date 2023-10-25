import 'package:flutter/material.dart';

import '../../../../widgets/widgets.dart';

class InfoProducts extends StatelessWidget {
  final String id;
  final String name;
  final String img;
  final String description;

  const InfoProducts({
    Key? key,
    required this.img,
    required this.name,
    required this.id,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CardInfoCustomWidget(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
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
              Text(name),
              Text('ID: $id'),
              SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Text(description)),
            ],
          ),
        ),
      ),
    );
  }
}
