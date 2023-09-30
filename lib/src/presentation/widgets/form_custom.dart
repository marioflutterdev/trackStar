import 'package:flutter/material.dart';

class FormCustomWidget extends StatelessWidget {
  final TextInputType? keyboardType;
  final String? hintText;
  final Widget? prefixIcon;
  final bool? obscureText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  const FormCustomWidget({
    Key? key,
    this.keyboardType,
    this.prefixIcon,
    this.hintText,
    this.obscureText,
    this.controller,
    this.onChanged,
    this.onFieldSubmitted,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey.shade300,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          )
        ],
      ),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        focusNode: focusNode,
        autocorrect: false,
        keyboardType: keyboardType ?? TextInputType.emailAddress,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: hintText ?? 'none',
        ),
      ),
    );
  }
}