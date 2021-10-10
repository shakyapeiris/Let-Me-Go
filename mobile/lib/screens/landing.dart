import 'package:flutter/material.dart';
import 'package:mobile/components/landing/card.dart';
import 'package:google_fonts/google_fonts.dart';

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffffffff),
              Color(0xffD6D6D6),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Let me go",
                style: GoogleFonts.nunito(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "Have a safe journey",
                style: GoogleFonts.openSans(
                  fontSize: 30,
                  fontWeight: FontWeight.w100,
                ),
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset('images/ambulance.png'),
                ),
              ),
              Text(
                "Continue as a,",
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'OpenSans-Light',
                ),
                textAlign: TextAlign.center,
              ),
              Row(
                children: [
                  NavCard(
                    image: 'images/hospital.png',
                    text: "Hospital",
                    route: '/ambulance/login',
                  ),
                  NavCard(
                    image: 'images/car.png',
                    text: "User",
                    route: '/user',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
