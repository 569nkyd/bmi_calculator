import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";

  var bgcolor = Colors.yellow.shade100;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar (
        backgroundColor: Colors.pink,
        title: Text("Know your BMI",
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.w800, color: Colors.white),),
      ),
      body: Container(
        color: bgcolor,
        child: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center ,
              children:[
                Text('BMI',
                  style: TextStyle(fontSize: 28,fontWeight: FontWeight.w700),),

                SizedBox(height: 18),

                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.line_weight),
                    label: Text('Enter Your weight(in Kgs)'),

                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 18),

                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.height),
                    label: Text('Enter Your height(in ft)'),

                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 18),

                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.donut_small),
                    label: Text('Enter Your weight(in inch)'),

                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 19),
                ElevatedButton(onPressed: (){
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();

                  if(wt !="" && ft!="" && inch!=""){
                    var iWt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var iInch = int.parse(inch);

                    var tInch = (iFt*12) + iInch;
                    var tCm = tInch * 2.54;
                    var tM = tCm/100;
                    var bmi = iWt/(tM*tM);
                    var msg = "";

                    if(bmi>25){
                      msg = "You are over weight";
                      bgcolor = Colors.orange.shade200;
                    } else if(bmi<18){
                      msg = 'You are under weight';
                      bgcolor= Colors.red.shade200;
                    } else {
                      msg ="You are healthy";
                      bgcolor = Colors.green.shade200;
                    }

                    setState(() {
                      result = "$msg \n Your BMI Is: ${bmi.toStringAsFixed(2)}";
                    });

                  }else {
                    result = "*Please fill all data";

                    setState(() {

                    });

                  }
                },
                    child: Text('Calculate',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),
                )),
                SizedBox(height: 18),

                Text(result,style:TextStyle(fontSize: 18,fontWeight: FontWeight.w700),)
              ],

            ),
          ),
        ),
      ),

    );
  }
}

