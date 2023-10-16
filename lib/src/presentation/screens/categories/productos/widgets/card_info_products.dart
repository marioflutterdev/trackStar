import 'package:flutter/material.dart';

class CardInfoProducts extends StatelessWidget {
  const CardInfoProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: CustomPaint(
          painter: _CustomPaintCard(context: context),
        ),
      ),
    );
  }
}

class _CustomPaintCard extends CustomPainter {
  final BuildContext context;

  _CustomPaintCard({required this.context});
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    lapiz.color = Theme.of(context).colorScheme.onPrimaryContainer;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 5;

    final path = Path();

    //? Crear Header
    path.lineTo(0, size.height * 0.50);
    path.quadraticBezierTo(
        size.width * .25, size.height * .05, size.width, size.height * .10);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    //? Crear Footer
    path.moveTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.8);
    path.quadraticBezierTo(
        size.width * 0.95, size.height * 0.95, size.width * 0.7, size.height);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
