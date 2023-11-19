import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:MyApp() ,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  //controller
  TextEditingController kgsController = TextEditingController();
  TextEditingController footController = TextEditingController();
  TextEditingController inchesController = TextEditingController();
  //variables
  var result = " ";
  var bgColor = Colors.indigo.shade200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: kgsController,
                  decoration: InputDecoration(
                    label: Text('Enter you weight (in Kgs) '),
                    prefixIcon: Icon(Icons.line_weight)
                  ),
                ),
                SizedBox(height: 11,),
                TextFormField(
                  controller: footController,
                  decoration: InputDecoration(
                      label: Text('Enter you height (in foot) '),
                      prefixIcon: Icon(Icons.height)
                  ),
                ),
                SizedBox(height: 11,),
                TextFormField(
                  controller: inchesController,
                  decoration: InputDecoration(
                      label: Text('Enter you height (in inches) '),
                      prefixIcon: Icon(Icons.height)
                  ),
                ),
                SizedBox(height: 16,),
                ElevatedButton(onPressed: (){

                  var kgs = kgsController.text.toString();
                  var foot = footController.text.toString();
                  var inches = inchesController.text.toString();

                  if(kgs != "" && foot != "" && inches != ""){

                    var intKgs = int.parse(kgs);
                    var intFoot = int.parse(foot);
                    var intInches = int.parse(inches);

                    var tInches = (intFoot*12)+intInches;
                    var tCm = tInches*2.54;
                    var tM = tCm/100;
                    var bmi = intKgs/(tM*tM);

                    var msg = '';

                    if(bmi>25){
                      msg = 'You are Overweight';
                      bgColor = Colors.orange.shade200;
                    }else if(bmi<18){
                      msg = 'You are Underweight';
                      bgColor = Colors.red.shade200;
                    }else{
                      msg = 'You are Healthy';
                      bgColor = Colors.green.shade200;
                    }
                    setState(() {
                      result = '$msg \n Your BMI is:- ${bmi.toStringAsFixed(2)}';
                    });

                  }else{
                    setState(() {
                      result = 'Please fill up all the fields!!';
                    });
                  }
                }, child: Text('Calculate')),
                Text(result,style: TextStyle(fontSize: 19),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
