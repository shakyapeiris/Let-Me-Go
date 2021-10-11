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
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
        ),
        Expanded(
          child: Container(
            height: 40.0,
            margin: EdgeInsets.all(5.0),
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: focused ? focusedColor : borderColor,
                  width: 1,
                ),
              ),
            ),
            child: TextField(
              keyboardType: type,
              style: GoogleFonts.openSans(
                color: textColor,
                fontSize: 14.0,
              ),
              textAlign: TextAlign.left,
              cursorColor: focusedColor,
              focusNode: inputFocusNode,
              controller: inputController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: placeholder,
                hintStyle: GoogleFonts.openSans(
                  color: placeholderColor,
                ),
              ),
            ),
          ),
        ),
        hasError
            ? Text(
                errorMessage,
                style: GoogleFonts.openSans(
                  color: Colors.red,
                ),
              )
            : Container()
      ],
    );
  }
}
