import 'package:flutter/material.dart';

import 'package:beauty_flutter/shared/theme/text_styles.dart';

class CustomInputTextWidget extends StatelessWidget {
  const CustomInputTextWidget({
    Key? key,
    required this.controller,
    required this.onChanged,
    required this.focusNode,
    required this.labelText,
    required this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final FocusNode focusNode;
  final String labelText;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      validator: validator,
      style: TextStyles.inputText,
      onChanged: onChanged,
      focusNode: focusNode,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
        labelText: labelText,
        fillColor: Colors.grey[100],
        filled: true,
      ),
    );
  }
}
