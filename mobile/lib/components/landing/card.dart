import 'package:flutter/material.dart';

class NavCard extends StatelessWidget {
  final String image;
  final String text;
  final String route;
  const NavCard({
    Key? key,
    required this.image,
    required this.text,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Container(
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            color: Color(0xffFFE58F),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                image,
                width: 140,
                height: 140,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Nunito-Light',
                  fontSize: 24,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
