import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'icon_widget.dart';
import 'reusable_card.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  static const _kBottomContainerHeight = 80.0;
  static const _kSliderInactiveColor = Color(0xFF8D8E89);
  static const _kSliderOverlayColor = Color(0x29EB1555);

  Gender selectedGender;
  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onTapCard: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      cardColour: selectedGender == Gender.male
                          ? kActiveColor
                          : kInactiveColor,
                      cardChild: new IconWidget(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onTapCard: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      cardColour: selectedGender == Gender.female
                          ? kActiveColor
                          : kInactiveColor,
                      cardChild: new IconWidget(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                cardColour: kInactiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          overlayColor: _kSliderOverlayColor,
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 15.0,
                          ),
                          overlayShape: RoundSliderOverlayShape(
                            overlayRadius: 30.0,
                          ),
                          thumbColor: kMainAccentColor),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 230,
                        inactiveColor: _kSliderInactiveColor,
                        onChanged: (value) {
                          setState(() {
                            height = value.toInt();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      cardColour: kInactiveColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardColour: kInactiveColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: kMainAccentColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: _kBottomContainerHeight,
            )
          ],
        ),
      ),
    );
  }
}
