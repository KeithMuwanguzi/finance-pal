import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPasswordFormField extends StatelessWidget {
  const CustomPasswordFormField({
    super.key,
    required this.controller,
    required this.validate,
    required this.text,
    required this.isVisible,
    required this.onPressed,
  });

  final TextEditingController controller;
  // ignore: prefer_typing_uninitialized_variables
  final validate;
  final String text;
  final bool isVisible;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isVisible,
      validator: validate,
      controller: controller,
      decoration: InputDecoration(
        label: Text("Password", style: GoogleFonts.poppins(fontSize: 14)),
        suffixIcon: IconButton(
            onPressed: onPressed,
            icon: isVisible
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off)),
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      textCapitalization: TextCapitalization.none,
      autocorrect: false,
    );
  }
}
