import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.cardColour, this.cardChild, this.onTapCard});

  final Color cardColour;
  final Widget cardChild;
  final Function onTapCard;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: GestureDetector(
        onTap: onTapCard,
        child: Container(
          child: cardChild,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: cardColour,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
