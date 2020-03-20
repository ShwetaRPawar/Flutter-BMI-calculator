import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'bottom_button.dart';
import 'round_button.dart';
import 'bmi_calculation.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColor = kinactiveCardColor;
  Color femaleCardColor = kinactiveCardColor;

  Gender  selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                  child: ResusableCard(
                    onPress:(){
                      selectedGender = Gender.male;
                    },
                    colour: selectedGender == Gender.male ? kactiveCardColor : kinactiveCardColor,
                    cardChild: IconContent(awsIcon: FontAwesomeIcons.mars, iconText: 'MALE',),
                  ),
              ),
              Expanded(
                  child:  ResusableCard(
                    onPress:(){
                      selectedGender = Gender.female;
                    },
                    colour: selectedGender == Gender.female ? kactiveCardColor : kinactiveCardColor,
                    cardChild: IconContent(awsIcon: FontAwesomeIcons.venus, iconText: 'FEMALE',),
                  ),
              ),
            ],
          )),
          Expanded(
              child:  ResusableCard(
                colour: kactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Hight',
                      style: klabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.baseline,
                     textBaseline: TextBaseline.alphabetic,
                     children: <Widget>[
                       Text(
                         height.toString(),
                         style: kNumberStyle,
                       ),
                       Text(
                         'cm',
                         style: klabelTextStyle,
                       )
                     ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        overlayColor: Color(0x29EB1555),
                        thumbColor: Color(0xFFEB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          onChanged: (double newValue){
                            setState(() {
                              height = newValue.round();
                            });
                          },
                      ),
                    ),
                  ],
                ),
              ),
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                  child:  ResusableCard(
                    colour: kactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: klabelTextStyle,
                          ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ),
              Expanded(
                  child:  ResusableCard(
                    colour: kactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: klabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
              ),
            ],
          )),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap:(){

              BMICalculation calc = BMICalculation(height: height, weight: weight);

          Navigator.push(context, MaterialPageRoute(
          builder: (context) => ResultPage(
            bmiResult: calc.calculateBMI(),
            resultText: calc.getResult(),
            interpretation: calc.getInterpretation(),
          )
          ),
          );
          },
          ),
        ],
      ),
    );
  }
}

