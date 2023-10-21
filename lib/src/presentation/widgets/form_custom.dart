import 'package:flutter/material.dart';

class FormCustomWidget extends StatefulWidget {
  final double? border;
  final bool? textExtraLarge;
  final TextInputType? keyboardType;
  final String? hintText;
  final Widget? prefixIcon;
  final bool? obscureText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
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
    this.validator,
    this.textExtraLarge = false,
    this.border,
  }) : super(key: key);

  @override
  State<FormCustomWidget> createState() => _FormCustomWidgetState();
}

class _FormCustomWidgetState extends State<FormCustomWidget> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.border ?? 50),
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
        maxLines: widget.textExtraLarge! ? 3 : 1,
        cursorColor: Colors.black,
        controller: widget.controller,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onFieldSubmitted,
        focusNode: widget.focusNode,
        autocorrect: false,
        keyboardType: widget.keyboardType ?? TextInputType.emailAddress,
        obscureText: widget.obscureText == true ? _obscureText : false,
        maxLength: widget.textExtraLarge! ? 150 : null,
        style: const TextStyle(color: Colors.black),
        validator: widget.validator,
        decoration: InputDecoration(
          suffixIcon: widget.obscureText == true
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                  child: GestureDetector(
                    onTap: _toggle,
                    child: Icon(
                      _obscureText
                          ? Icons.visibility_rounded
                          : Icons.visibility_off_rounded,
                      size: 24,
                      color: Colors.black,
                    ),
                  ),
                )
              : null,
          prefixIcon: widget.prefixIcon,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: widget.hintText ?? 'none',
          hintStyle: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
