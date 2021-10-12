import 'package:flutter/material.dart';

class InputValidator {
  late TextEditingController inputController;
  late FocusNode inputFocusNode;
  late bool Function(String) validationLogic;
  late void Function(void Function()) stateFunc;
  bool inputFocused = false;
  bool inputTouched = false;
  bool isInputValid = true;

  InputValidator({
    required bool Function(String) validator,
    required void Function(void Function()) state,
  }) {
    inputController = new TextEditingController();
    inputFocusNode = new FocusNode();

    validationLogic = validator;

    inputController.addListener(changeInputHandler);
    inputFocusNode.addListener(changeFocusHandler);

    stateFunc = state;
  }

  void changeFocusHandler() {
    if (inputFocusNode.hasFocus != inputFocused) {
      stateFunc(() {
        inputFocused = inputFocusNode.hasFocus;
      });
    }

    if (!inputTouched) {
      stateFunc(() {
        inputTouched = true;
      });
    }
  }

  void changeInputHandler() {
    if (!inputFocused && inputTouched) {
      stateFunc(() {
        isInputValid = validationLogic(inputController.text);
      });
    }
  }

  void dispose() {
    inputController.dispose();
    inputFocusNode.dispose();
  }
}
