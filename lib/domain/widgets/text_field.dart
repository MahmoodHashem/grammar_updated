

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class AppTextField extends StatelessWidget {
  final FocusNode? focusNode;
  final bool expand;
  final TextInputType? textInput;
  final bool autoFocus;
  final TextInputAction inputAction;
  final TextEditingController? controller;
  final String hint;
  final double? size;

  AppTextField({
    this.focusNode,
    required this.size,
    required this.hint,
    this.controller,
    this.expand = false,
    required this.textInput,
    this.autoFocus = false,
    this.inputAction = TextInputAction.next});

  bool isRTL(String text) {
    return intl.Bidi.detectRtlDirectionality(text);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: true,
      focusNode: focusNode,
      maxLines: null,
      autofocus: autoFocus,
      keyboardType: textInput,
      controller: controller,
      textAlign: isRTL(controller!.text) ? TextAlign.right : TextAlign.left,
      cursorHeight: size!,
      textDirection: isRTL(controller!.text) ? TextDirection.rtl : TextDirection.ltr,
      textAlignVertical: TextAlignVertical.top,
      cursorColor: Colors.blue.shade800,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: size,
          )
      ),
      style: TextStyle(
        fontSize: size,
      ),
    );
  }
}