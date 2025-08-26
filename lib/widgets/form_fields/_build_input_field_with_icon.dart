import 'package:flutter/material.dart';
import '../../constants.dart';

class BuildInputFieldWithIcon extends StatefulWidget {
  final String label;
  final bool isPassword;

  const BuildInputFieldWithIcon({
    Key? key,
    required this.label,
    required this.isPassword,
  }) : super(key: key);

  @override
  State<BuildInputFieldWithIcon> createState() => _BuildInputFieldWithIconState();
}

class _BuildInputFieldWithIconState extends State<BuildInputFieldWithIcon> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isPassword ? _obscurePassword : false,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: const TextStyle(color: secondaryTextColor),
        filled: true,
        fillColor: veryDarkGrey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: veryDarkGrey,
            width: 1.0,
          ),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  color: secondaryTextColor,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              )
            : const Icon(Icons.check_circle_outline, color: primaryColor),
      ),
    );
  }
}