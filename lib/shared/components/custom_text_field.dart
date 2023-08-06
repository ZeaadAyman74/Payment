import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled(
      {Key? key, this.inputType = TextInputType
          .text, required this.errorMessage, this.isPass = false, required this.hint, required this.prefixIcon,required this.onSave})
      : super(key: key);
  final TextInputType inputType;
  final String errorMessage;
  final bool isPass;
  final String hint;
  final IconData prefixIcon;
  final void Function(String? value) onSave;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      obscureText: isPass,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(color:  Colors.grey),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color:  Colors.grey),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color:  Colors.grey),
        ),
        hintText: hint,
        prefixIcon: Icon(prefixIcon, color:  Colors.grey,),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return errorMessage;
        }
        return null;
      },
      onSaved:onSave,
    );
  }
}
