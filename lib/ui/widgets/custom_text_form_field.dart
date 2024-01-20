import 'package:flutter/material.dart';
import 'package:peek/helpers/extensions/build_context/build_context.dart';

import '../../helpers/constants/colors.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {super.key,
      required this.label,
      this.hint,
      required this.controller,
      this.isPassword = false,
      this.isObscure = false,
      this.errorText,
      this.onTap,
      this.onChange,
      this.validate,
      this.textInputType,
      this.readOnly = false,
      this.max});
  final String label;
  final String? hint;
  final TextEditingController controller;
  final bool isPassword;
  final bool isObscure;
  final String? errorText;
  final VoidCallback? onTap;
  final Function(String?)? onChange;
  final String? Function(String?)? validate;
  final TextInputType? textInputType;
  final bool readOnly;
  final int? max;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isFocused = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isObscure,
      keyboardType: widget.textInputType ?? TextInputType.text,
      readOnly: widget.readOnly,
      validator: widget.validate,
      maxLines: widget.max,
      onChanged: widget.onChange,
      style: context.textTheme.labelLarge?.copyWith(color: AppColors.white),
      decoration: InputDecoration(
          filled: true,
          label: Text(widget.label),
          labelStyle: context.textTheme.labelMedium?.copyWith(
              color: _isFocused ? AppColors.textGrey : AppColors.white),
          fillColor: AppColors.fillColor,
          hintText: widget.hint,
          hintStyle: TextStyle(
              color: AppColors.buttonColor.withOpacity(0.3), fontSize: 11),
          errorText: widget.errorText,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                color: AppColors.buttonColor), // Orange border when focused
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: widget.onTap,
                  icon: Icon(
                    widget.isObscure
                        ? Icons.visibility_off
                        : Icons.visibility_sharp,
                    color: AppColors.white,
                  ),
                )
              : null),
    );
  }
}

// class CustomTextFormField extends StatelessWidget {
//   final String label;
//   final String? hint;
//   final TextEditingController controller;
//   final bool isPassword;
//   final bool isObscure;
//   final String? errorText;
//   final VoidCallback? onTap;
//   final Function(String?)? onChange;
//   final String? Function(String?)? validate;
//   final TextInputType? textInputType;
//   final bool readOnly;
//   final int max;
//
//   const CustomTextFormField(
//       {Key? key,
//       required this.label,
//       required this.controller,
//       this.isPassword = false,
//       this.readOnly = false,
//       this.textInputType,
//       this.hint,
//       this.validate,
//       this.onTap,
//       this.onChange,
//       this.isObscure = false,
//       this.errorText,
//       this.max = 1})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: context.heightPercent(0.06),
//       child: TextFormField(
//         controller: controller,
//         obscureText: isObscure,
//         keyboardType: textInputType ?? TextInputType.text,
//         readOnly: readOnly,
//         validator: validate,
//         maxLines: max,
//         onChanged: onChange,
//         decoration: InputDecoration(
//             filled: true,
//             label: Text(label),
//             fillColor: AppColors.fillColor,
//             hintText: hint,
//             hintStyle: TextStyle(
//                 color: AppColors.buttonColor.withOpacity(0.3), fontSize: 11),
//             errorText: errorText,
//             floatingLabelBehavior: FloatingLabelBehavior.always,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(color: AppColors.white),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(color: AppColors.white),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(
//                   color: AppColors.buttonColor), // Orange border when focused
//             ),
//             suffixIcon: isPassword
//                 ? IconButton(
//                     onPressed: onTap,
//                     icon: Icon(
//                       isObscure ? Icons.visibility_off : Icons.visibility_sharp,
//                       color: AppColors.primary,
//                     ),
//                   )
//                 : null),
//       ),
//     );
//   }
// }
