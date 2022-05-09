import 'package:bmi_app/Screens/result.dart';
import 'package:bmi_app/components/calcBrain.dart';
import 'package:bmi_app/components/icon_content.dart';
import 'package:bmi_app/contants.dart';
import 'package:flutter/material.dart';

enum GenderType { male, female }

class InputPage extends StatefulWidget {
  InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double _currentSliderValue = 1;
  int height = 170;
  int age = 20;
  int weight = 70;
  Color femaleCardColor = kinactiveCardColor;
  Color maleCardColor = kactiveCardColor;

  void updateColorCard(GenderType gender) {
    if (gender == GenderType.male) {
      if (maleCardColor == kinactiveCardColor) {
        maleCardColor = kactiveCardColor;
        femaleCardColor = kinactiveCardColor;
      } else {
        maleCardColor = kinactiveCardColor;
      }
    }

    if (gender == GenderType.female) {
      if (femaleCardColor == kinactiveCardColor) {
        femaleCardColor = kactiveCardColor;
        maleCardColor = kinactiveCardColor;
      } else {
        femaleCardColor = kinactiveCardColor;
      }
    }
  }

  moveOnResult(ctx) {
    Navigator.push(ctx, MaterialPageRoute(builder: (ctx) {
      CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
      return Result(
        bmiResult: calc.calculateBMI(),
        interpretation: calc.getInterpretation(),
        resultText: calc.getResult(),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: kactiveCardColor,
          title: Text(
            'B.M.I Calculator',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0),
          ),
        ),
        body: SafeArea(
          minimum: EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColorCard(GenderType.male);
                        });
                      },
                      child: Card(
                        color: maleCardColor,
                        child: IconContent(
                          icon: Icons.male,
                          label: 'Male',
                        ),
                      ),
                    )),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColorCard(GenderType.female);
                        });
                      },
                      child: Card(
                        color: femaleCardColor,
                        child: IconContent(
                          icon: Icons.female,
                          label: 'Female',
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              Expanded(
                child: Card(
                  color: kactiveCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: klabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '${height}',
                            style: knumberTextStyle,
                          ),
                          Text('cm'),
                        ],
                      ),
                      Slider(
                        activeColor: Colors.teal[200],
                        inactiveColor: kinactiveCardColor.withOpacity(.6),
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        divisions: 100,
                        onChanged: (newValue) {
                          setState(() {
                            height =
                                newValue.toInt(); // move th value in the slider
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        color: kactiveCardColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Age',
                              style: klabelTextStyle,
                            ),
                            Text(
                              '${age}',
                              style: knumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      age > 0 ? age-- : age;
                                    });
                                  },
                                  child: Icon(Icons.remove),
                                ),
                                const SizedBox(
                                  width: 11,
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  child: const Icon(Icons.add),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                          child: Card(
                        color: kactiveCardColor,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Weight',
                                style: klabelTextStyle,
                              ),
                              Text(
                                '${weight}',
                                style: knumberTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    child: const Icon(Icons.remove),
                                    onPressed: () {
                                      setState(() {
                                        weight > 0 ? weight-- : weight;
                                      });
                                    },
                                  ), //
                                  SizedBox(width: 11),
                                  FloatingActionButton(
                                    child: const Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                  )
                                ],
                              )
                            ]),
                      )),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  moveOnResult(context);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10.0),
                  padding: EdgeInsets.only(bottom: 10.0),
                  height: 70.0,
                  child: Card(
                      child: Center(
                        child: Text(
                          'calculate',
                          style: klargestButtonTextStyle,
                        ),
                      ),
                      color: Color(0xFFE4B835),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              )
            ],
          ),
        ));
  }
}
