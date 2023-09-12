import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton(
      {super.key,
      required this.text,
      required this.ontap,
      this.color = Colors.black});
  final String text;
  final Function ontap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 48,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
      child: ElevatedButton(
          onPressed: () {
            ontap();
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.white;
                }
                return color;
              }),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)))),
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          )),
    );
  }
}
