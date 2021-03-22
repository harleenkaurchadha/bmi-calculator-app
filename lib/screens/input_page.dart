import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/Bottom_button.dart';
import '../components/Round_icon_button.dart';
import '../calculator_brain.dart';


enum Gender{
  Male,
  Female,
}

int height = 180;
int weight = 60;
int age = 19;


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(                        //expanded widget is used i\n row n column's child also to ensure the child are divided into equal
          children : [
            Expanded(                                          //alternative to giving height & width in order to support all device sizes
                child: Row(
                  children : [
                    Expanded(
                      child: ReusableCard(
                        colour: selectedGender == Gender.Male ? kactiveCardColor
                            : kinactiveCardColor,
                        childData: IconContent(
                          icon: FontAwesomeIcons.mars,
                          data: 'MALE',
                        ),
                        onPress: (){
                          setState(() {
                            selectedGender = Gender.Male;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        colour: selectedGender == Gender.Female ? kactiveCardColor
                            : kinactiveCardColor,
                        childData: IconContent(
                        icon: FontAwesomeIcons.venus,
                        data: 'FEMALE',
                      ),
                        onPress: (){
                          setState(() {
                            selectedGender = Gender.Female;
                          });
                        },
                      ),
                    ),
                  ],

                ),
            ),
            Expanded(
              child: ReusableCard(
                  colour: kactiveCardColor,
                  childData: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('HEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.ideographic,
                        children: [
                          Text(height.toString(),
                          style: kNumberTextStyle,
                          ),
                          Text('cm',
                          style: kLabelTextStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29eb1555),
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xFF8D8E98),
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
              )
             ),
            Expanded(
                child:  Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                          colour: kactiveCardColor,
                          childData:  Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('WEIGHT',
                              style: kLabelTextStyle,
                              ),
                              Text(weight.toString(),
                              style: kNumberTextStyle,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: (){
                                      setState(() {
                                        weight --;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPressed: (){
                                      setState(() {
                                        weight ++;
                                      });
                                    },
                                  ),
                               ],
                              ),
                            ],
                          ),
                      )
                    ), 
                    Expanded(
                      child: ReusableCard(
                          colour: kactiveCardColor,
                          childData:  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('AGE',
                              style: kLabelTextStyle,
                            ),
                            Text(age.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: (){
                                    setState(() {
                                      age --;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: (){
                                    setState(() {
                                      age ++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ),
                  ],
                ),
            ),
            BottomButton(label: 'CALCULATE',
            onTap: (){
              CalculatorBrain calc = CalculatorBrain(
                height: height,
                weight: weight,
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Results(
                bmi: calc.calculateBMI(),
                result: calc.getResult(),
                interpretation: calc.getInterpretation(),
                ),
                ),
              );
            },
            ),
          ],
     ),
    );
  }
}





