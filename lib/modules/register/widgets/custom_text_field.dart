import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String? hint;
  final TextEditingController myController;
  final TextInputType type;
  final void Function(String?)? onSave;
  final IconData? suffixIcon;
   final Function()? suffixPress;
  final String? Function(String? value) validate;
  final Function(String)? onSubmit;

  const MyTextField({
    Key? key,
    this.hint,
    this.type = TextInputType.text,
    required this.myController,
    required this.validate,
    this.onSave,
    this.suffixIcon,
    this.suffixPress,
    this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style:const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black) ,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red)),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          // borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red)),
        hintText: hint ?? '',
        hintStyle: const TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.black),
        suffixIcon:suffixIcon!=null? IconButton(
          icon: Icon(
            suffixIcon,
            color: Colors.black,
          ),
          onPressed: suffixPress,
        ):null,
        contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 6),
      ),
      onSaved: onSave,
      controller: myController,
      keyboardType: type,
      validator: validate,
      onFieldSubmitted:onSubmit ,
    );
  }
}
