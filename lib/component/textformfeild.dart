import 'package:flutter/material.dart';

Widget defaultTFF({
  required TextEditingController controller,
  required TextInputType type,
  required Function validate,
  Function? onchange,
  Function? onsubmit,
  IconData? prefix,
  String? lable,
  IconData? sufix,
  bool ispassword = false,
  int? maxLength,
  bool maxLengthEnforce=true
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: ispassword,
      validator: (value) {
        return validate(value);
      },
      onChanged: (value) => onchange,
      onFieldSubmitted: (value) => onsubmit,
      decoration: InputDecoration(
        prefixIcon: Icon(prefix),
        hintText: lable,
        border: const OutlineInputBorder(),
        suffixIcon: Icon(sufix),
        
      ),
    );
