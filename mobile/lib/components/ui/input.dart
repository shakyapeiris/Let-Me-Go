import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Input extends StatelessWidget {
  Input({
    Key? key,
    required this.placeholder,
    required this.borderColor,
    required this.textColor,
    required this.inputController,
    required this.focused,
    required this.focusedColor,
    required this.inputFocusNode,
    required this.type,
    required this.placeholderColor,
    required this.hasError,
    required this.errorMessage,
  });
  final TextEditingController inputController;
  final FocusNode inputFocusNode;
  final TextInputType type;
  final bool focused;
  final bool hasError;
  final String placeholder;
  final String errorMessage;
  final Color placeholderColor;
  final Color textColor;
  final Color borderColor;
  final Color focusedColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(
          keyboardType: type,
          style: GoogleFonts.openSans(
            color: textColor,
            fontSize: 14.0,
          ),
          textAlign: TextAlign.left,
          textAlignVertical: TextAlignVertical.bottom,
          cursorColor: focusedColor,
          focusNode: inputFocusNode,
          controller: inputController,
          decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: borderColor,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: focusedColor,
              ),
            ),
            hintText: placeholder,
            hintStyle: GoogleFonts.openSans(
              color: placeholderColor,
            ),
          ),
        ),
      ),
    );
  }
}
