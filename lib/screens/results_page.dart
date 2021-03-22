import 'package:flutter/material.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import '../components/Bottom_button.dart';
import 'input_page.dart';

class Results extends StatelessWidget {

  final String bmi;
  final String result;
  final String interpretation;

  Results({@required this.bmi, @required this.result, @required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result',
                  style: kLargeTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kactiveCardColor,
              childData: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(result.toUpperCase(),
                  style: kResultTextStyle,
                  ),
                  Text(bmi,
                  style: kBMITextStyle,
                  ),
                  Text(interpretation,
                  style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: BottomButton(label: 'Re- Calculate',
            onTap: (){
              Navigator.pop(context);
            },
            ),
          ),
        ],
      ),
    );
  }
}
