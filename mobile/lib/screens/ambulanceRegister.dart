import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/components/ui/input.dart';
import 'package:mobile/components/ui/button.dart';
import '../utils/inputValidator.dart';

class AmbulanceReg extends StatefulWidget {
  const AmbulanceReg({Key? key}) : super(key: key);

  @override
  _AmbulanceRegState createState() => _AmbulanceRegState();
}

class _AmbulanceRegState extends State<AmbulanceReg> {
  late InputValidator nameValidator;
  late InputValidator contactNo;
  late InputValidator vehicleType;
  late InputValidator vehicleNo;
  late InputValidator hospital;
  late InputValidator password;

  @override
  void initState() {
    super.initState();
    nameValidator = InputValidator(
      validator: (inputVal) => inputVal.trim() != "",
      state: setState,
    );
    contactNo = InputValidator(
      validator: (inputVal) =>
          inputVal.startsWith("0") && inputVal.length == 10,
      state: setState,
    );
    vehicleType = InputValidator(
      validator: (inputVal) => inputVal.trim() != "",
      state: setState,
    );
    vehicleNo = InputValidator(
      validator: (inputVal) => inputVal.trim() != "",
      state: setState,
    );
    hospital = InputValidator(
      validator: (inputVal) => inputVal.trim() != "",
      state: setState,
    );
    password = InputValidator(
      validator: (inputVal) => inputVal.trim() != "" && inputVal.length >= 6,
      state: setState,
    );
  }

  void dispose() {
    super.dispose();
    nameValidator.dispose();
    contactNo.dispose();
    vehicleType.dispose();
    vehicleNo.dispose();
    hospital.dispose();
    password.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffBE6FFD),
              Color(0xff98E7F9),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0, 0.7],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: double.infinity,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Continue as an",
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w900,
                            fontSize: 24.0,
                          ),
                        ),
                        Text(
                          "AMBULANCE",
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w900,
                            fontSize: 24.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Image.asset(
                        'images/driver2.png',
                      ),
                    ),
                  ),
                ],
              ),
              Input(
                placeholder: "Name of the driver",
                borderColor: Colors.black87,
                textColor: Colors.black,
                inputController: nameValidator.inputController,
                focused: nameValidator.inputFocused,
                focusedColor: Colors.black,
                inputFocusNode: nameValidator.inputFocusNode,
                type: TextInputType.text,
                placeholderColor: Color(0xff7E7C7C),
                hasError: nameValidator.isInputValid,
                errorMessage: "Please enter a valid name",
              ),
              Input(
                placeholder: "Contact Number",
                borderColor: Colors.black87,
                textColor: Colors.black,
                inputController: contactNo.inputController,
                focused: contactNo.inputFocused,
                focusedColor: Colors.black,
                inputFocusNode: contactNo.inputFocusNode,
                type: TextInputType.phone,
                placeholderColor: Color(0xff7E7C7C),
                hasError: contactNo.isInputValid,
                errorMessage: "Please enter a valid contact number",
              ),
              Input(
                placeholder: "Vehicle type",
                borderColor: Colors.black87,
                textColor: Colors.black,
                inputController: vehicleType.inputController,
                focused: vehicleType.inputFocused,
                focusedColor: Colors.black,
                inputFocusNode: vehicleType.inputFocusNode,
                type: TextInputType.text,
                placeholderColor: Color(0xff7E7C7C),
                hasError: vehicleType.isInputValid,
                errorMessage: "Please enter a valid vehicle type",
              ),
              Input(
                placeholder: "Vehicle number",
                borderColor: Colors.black87,
                textColor: Colors.black,
                inputController: vehicleNo.inputController,
                focused: vehicleNo.inputFocused,
                focusedColor: Colors.black,
                inputFocusNode: vehicleNo.inputFocusNode,
                type: TextInputType.text,
                placeholderColor: Color(0xff7E7C7C),
                hasError: vehicleNo.isInputValid,
                errorMessage: "Please enter a valid vehicle number",
              ),
              Input(
                placeholder: "Hospital",
                borderColor: Colors.black87,
                textColor: Colors.black,
                inputController: hospital.inputController,
                focused: hospital.inputFocused,
                focusedColor: Colors.black,
                inputFocusNode: hospital.inputFocusNode,
                type: TextInputType.text,
                placeholderColor: Color(0xff7E7C7C),
                hasError: hospital.isInputValid,
                errorMessage: "Please enter a valid hospital name",
              ),
              Input(
                placeholder: "Password",
                borderColor: Colors.black87,
                textColor: Colors.black,
                inputController: password.inputController,
                focused: password.inputFocused,
                focusedColor: Colors.black,
                inputFocusNode: password.inputFocusNode,
                type: TextInputType.text,
                placeholderColor: Color(0xff7E7C7C),
                hasError: password.isInputValid,
                errorMessage: "Please enter a valid password",
              ),
              Container(
                height: 20.0,
              ),
              Button(
                onPressed: () {},
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ),
                child: Text(
                  "Signup",
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.grey[600],
              ),
              Container(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: GoogleFonts.nunito(
                        color: Color(0xff777777),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "Sign in",
                    style: GoogleFonts.openSans(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
