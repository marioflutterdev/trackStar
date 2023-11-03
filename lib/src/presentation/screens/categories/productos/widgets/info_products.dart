import 'package:animate_do/animate_do.dart';
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
                  Text(name),
                  Text('ID: $id'),
                  SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: Text(description),
                  ),
                ],
              ),
              Positioned(
                top: 5,
                right: 0,
                child: _MenuButton(id),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuButton extends StatefulWidget {
  final String id;
  const _MenuButton(this.id);

  @override
  State<_MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<_MenuButton> {
  bool _visible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              _visible = !_visible;
            });
          },
          icon: Icon(!_visible ? Icons.menu : Icons.menu_open),
        ),
        Visibility(
          visible: _visible,
          child: FadeInLeft(
            from: 40,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
            ),
          ),
        ),
        Visibility(
          visible: _visible,
          child: FadeInLeft(
            from: 50,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
            ),
          ),
        ),
      ],
    );
  }
}
