import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../resourse/color.dart';
import '../resourse/styles.dart';


class Pincode extends StatelessWidget {
  TextEditingController controller;
  Function(String) onChange;
  final String? Function(String?)? validator;
  Pincode({
    super.key,
    required this.controller,
    required this.onChange,
    required this.validator,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      // height: 65,
      width: 45,

      margin: EdgeInsets.only(right: 8),
      child: TextFormField(
          controller: controller,
          validator: validator,
          onChanged: onChange,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
            errorStyle: Styles.errorstyle,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.grey,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.blue,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.red,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.red,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            /* border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.grey)),*/
          )),
    );
  }
}