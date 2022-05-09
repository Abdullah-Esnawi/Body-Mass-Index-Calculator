import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});
  final int height;
  final int weight;

  double _bmi =
      0.0; // private bmi variable to get the result and use in the function

  String calculateBMI() {
    //formula for calculate bmi
    _bmi = weight /
        pow(height / 100, 2); //height converted into metre by height/100
    // convert into single decimal place value of bmi and covert also into string
    return _bmi.toStringAsFixed(1);
  }

  // getter result to get the result
  String getResult() {
    // if(_bmi>=25){
    //   return 'Over-Weight';
    // }
    // else if(_bmi >18.5){
    //   return 'Normal';
    // }
    // else{
    //   return 'Under-Weight';
    // }

    if (_bmi < 18.5)
      return 'Underweight';
    else if (_bmi >= 18.5 && _bmi <= 24.9)
      return 'Normal';
    else if (_bmi >= 25 && _bmi <= 29.9)
      return 'overweight';
    else
      return 'Obese';
  }

// give some feedback to the user by creating function called getInterpretation

  String getInterpretation() {
    if (_bmi < 18.5) {
      // return 'You have a higher than normal body weight. Try to exercise more. 💪';
      return 'You weight falls within the underweight range. You can eat a bit more. ☹';
    } else if (_bmi >= 18.5 && _bmi <= 24.9) {
      return 'You have a normal body weight. Good Job! ☺';
    } else if (_bmi >= 25 && _bmi <= 29.9) {
      return 'You have a higher than normal body weight. Try to exercise more. 💪';
    } else {
      return 'You have a higher than normal body weight. Try to exercise more. 💪';
    }
  }
}
