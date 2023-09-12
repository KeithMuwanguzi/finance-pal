import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.size,
    required this.text,
    required this.bold,
    this.color,
    this.align,
  });
  final String text;
  final double size;
  final bool bold;
  final Color? color;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: GoogleFonts.poppins(
          fontSize: size,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          color: color ?? Colors.black),
    );
  }
}
