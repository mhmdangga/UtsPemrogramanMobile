part of 'pages.dart';

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      backgroundColor: Color(0xFFFFECAA),
      body: BMICalculatorForm(),
    );
  }
}

class BMICalculatorForm extends StatefulWidget {
  @override
  _BMICalculatorFormState createState() => _BMICalculatorFormState();
}

class _BMICalculatorFormState extends State<BMICalculatorForm> {
  double height = 170.0;
  double weight = 70.0;
  double bmi = 0.0;

  @override
  Widget build(BuildContext context) {
    
    return Container(
      
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'BMI Calculator',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Height (cm):'),
              Text(height.toStringAsFixed(1)),
            ],
          ),
          Slider(
            value: height,
            min: 100.0,
            max: 220.0,
            onChanged: (value) {
              setState(() {
                height = value;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Weight (kg):'),
              Text(weight.toStringAsFixed(1)),
            ],
          ),
          Slider(
            value: weight,
            min: 30.0,
            max: 200.0,
            onChanged: (value) {
              setState(() {
                weight = value;
              });
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              calculateBMI();
            },
            child: Text('Calculate BMI'),
          ),
          SizedBox(height: 20),
          Text('BMI: ${bmi.toStringAsFixed(2)}'),
        ],
      ),
    );
  }

  void calculateBMI() {
    // Formula to calculate BMI: weight (kg) / (height (m) * height (m))
    double heightInMeters = height / 100.0;
    double newBMI = weight / (heightInMeters * heightInMeters);
    setState(() {
      bmi = newBMI;
    });
  }
}
