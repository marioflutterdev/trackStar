import 'package:flutter/material.dart';

import '../screens/home/widgets/widgets.dart';
import 'xencard_custom/xencard_custom.dart';

class BodyUpdateItemCustomWidget extends StatelessWidget {
  final Widget child;
  final String title;

  const BodyUpdateItemCustomWidget({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return ButtonCustomHome(
      icon: Icons.add,
      onTap: () => showDialog(
        context: context,
        builder: (builder) => ScaffoldMessenger(
          child: Builder(
            builder: (context) => Scaffold(
              backgroundColor: Colors.transparent,
              body: XenPopupCard(
                cardBgColor: theme.background,
                appBar: XenCardAppBar(
                  color: theme.background,
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Center(
                          child: FittedBox(
                            child: Text(
                              title,
                              style: const TextStyle(fontSize: 45),
                            ),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                  ),
                ),
                body: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
