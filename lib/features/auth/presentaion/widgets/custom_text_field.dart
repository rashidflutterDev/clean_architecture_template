import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.isObsecured = false,
      this.isReadOnly = false,
      this.onTap});
  final String hintText;
  final bool isObsecured;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final bool isReadOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly: isReadOnly,
      obscureText: isObsecured,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$hintText is required';
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
      ),
    );
  }
}
