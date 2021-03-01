import 'package:flutter/material.dart';

class TextInputField extends TextField {
  final TextInputType type;
  final String hint;
  final IconData leadingIcon;
  final bool obscure;
  final Function onPress;
  final TextEditingController ctrl;

  TextInputField({
    Key key, 
    this.type,
    this.hint,
    this.leadingIcon,
    this.obscure = false,
    this.onPress,
    this.ctrl,
  }) : super(
    key: key,
    onTap: onPress,
    obscureText: obscure,
    controller: ctrl,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      focusColor: Colors.grey,
      // labelText: 'Email',
      hintText: hint,
      suffixIcon: Icon(leadingIcon, color: Colors.grey),
      contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0)
      // icon: Icon(Icons.account_circle)
    )
  );
}
