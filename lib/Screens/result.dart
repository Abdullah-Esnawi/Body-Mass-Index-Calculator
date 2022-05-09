import 'package:bmi_app/contants.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {

    final String bmiResult;
  final String resultText;
  final String interpretation;

  Result({Key? key, required this.bmiResult, required this.interpretation, required this.resultText})
      : super(key: key);

  // String get resultPhrase {
  //   String resultText = '';
  //   if (bmiResult < 18.5)
  //     resultText = 'Underweight';
  //   else if (bmiResult >= 18.5 && bmiResult <= 24.9)
  //     resultText = 'Normal';
  //   else if (bmiResult >= 25 && bmiResult <= 29.9)
  //     resultText = 'overweight';
  //   else if (bmiResult >= 30) resultText = 'Obese';

  //   return resultText;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('B.M.I Calculator'),
        centerTitle: true,
        backgroundColor: kactiveCardColor
      ),
      body: SafeArea(
        // child: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                child: const Center(
                  child: Text(
                    'Your Result',
                    style: ktitleTextStyle,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              
              child: Container(
                width:double.infinity,
                margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.teal),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText
                          .toUpperCase(), // use from calculator brain class
                      style: kresultTextStyle,
                    ),
                    Text(
                      '${bmiResult}', // use from calculator brain class
                      style: kBMITextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        interpretation, // use from calculator brain class
                        style: kbodyTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Card(
                  color: Color(0xFF1D1E33),
                  child: const Center(
                    child: Text(
                      'Re-Calculate',
                      style: klargestButtonTextStyle,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.only(bottom: 10.0),
                height: 70.0,
              ),
            ),
          ],
        ),
        // ),
      ),
    );
  }
}
