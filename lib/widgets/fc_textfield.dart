import 'package:flashcards_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FcTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final Icon? prefixIcon;
  final Icon? suffixIcon;

  const FcTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: TextInputAction.next,
      cursorColor: Colors.black,
      style: Theme.of(context).textTheme.labelLarge,
      inputFormatters: keyboardType == TextInputType.number
          ? [FilteringTextInputFormatter.digitsOnly]
          : null,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: FcColors.dialogBorder, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: FcColors.dialogSelectedOutlineColor,
            width: 2,
          ),
        ),
        filled: true,
        fillColor: FcColors.dialogTextFieldColor,
        hintText: hintText,
        hintStyle: TextStyle(color: FcColors.dialogPlaceholderColor),
      ),
    );
  }
}
