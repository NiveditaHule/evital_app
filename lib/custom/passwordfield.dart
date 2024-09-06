import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resourse/color.dart';
import '../resourse/styles.dart';

class PasswordField extends StatefulWidget {
  final String hintText;
  final controller;
  final hintStyle;
  String? Function(String?)? validator;
  final bool suffixIcon;
  final bool? isDense;
  final bool obscureText;

  PasswordField(
      {Key? key,
        required this.controller,
        required this.hintText,
        this.suffixIcon = false,
        this.isDense,
        this.validator,
        this.hintStyle,
        this.obscureText = false})
      : super(key: key);

  @override
  State<PasswordField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<PasswordField> {
  //
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      controller: widget.controller,
      obscureText: (widget.obscureText && _obscureText),
      decoration: InputDecoration(
        contentPadding:
        EdgeInsets.only(top: 15, bottom: 15, left: 16, right: 16),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.grey),
          //borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.red,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.blue,
            width: 1,
          ),
         // borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.red,
            width: 1,
          ),
         // borderRadius: BorderRadius.circular(8),
        ),
        isDense: (widget.isDense != null) ? widget.isDense : false,
        hintText: widget.hintText,
        errorStyle: Styles.errorstyle,
        hintStyle: widget.hintStyle ?? Styles.hintstyle,
        suffixIcon: widget.suffixIcon
            ? IconButton(
          icon: Icon(
            _obscureText
                ? Icons.remove_red_eye
                : Icons.visibility_off_outlined,
            color: Colors.black54,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        )
            : null,
        suffixIconConstraints: (widget.isDense != null)
            ? const BoxConstraints(maxHeight: 33)
            : null,
      ),
      validator: widget.validator,
    );
  }
}