import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopCard extends StatelessWidget {
  final String mainTopic;
  final String subTopic;
  const TopCard({
    Key? key,
    required this.mainTopic,
    required this.subTopic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(50.0),
        ),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mainTopic,
            style: GoogleFonts.openSans(
              fontWeight: FontWeight.w900,
              fontSize: 30,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            subTopic,
            style: GoogleFonts.nunito(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
