import 'package:flutter/material.dart';
import 'package:bmi/secondPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    //   initialRoute: '/',
    //   routes: {
    //     '/':(context)=>Homepage(),
    //     '/second':(context)=>SecondPage()
    // },

    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);


  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double _currentValue=100;
  double counter=50;
  double bmi=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("BMI Calculator",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),

      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,


        children:[
          Center(
            child: Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.yellowAccent,
                  border: Border.all(
                    color: Colors.yellow,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(200))
              ),
              child: Column(
                  children:[


                    Center(child: Text("Your Height",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),)),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(_currentValue.toString(),style: TextStyle(fontSize: 40),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Slider(
                        value: _currentValue,
                        min: 0,
                        max: 250,
                        divisions: 250,
                        activeColor: Colors.black,
                        label: _currentValue.toString(),
                        onChanged: (value){
                          setState((){
                            _currentValue = value;
                          });
                        },
                      ),
                    )

                  ]//children
              ),



            ),
          ),

          Center(
            child: Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  border: Border.all(
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(200))
              ),

              child: Column(
                children: [
                  Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Your Weight",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                  )),

                  Column(
                    children:[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(counter.toString(),style: TextStyle(fontSize: 40),),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Column(
                            children: [
                              FloatingActionButton(
                                  child:
                                  Center(child: Icon(Icons.add)),
                                  backgroundColor: Colors.black,
                                  foregroundColor:Colors.redAccent,

                                  onPressed: (){
                                    setState(() {

                                    });
                                    counter++;

                                  }
                              ),
                            ],
                          ),
                          FloatingActionButton(
                              child: Center(child: Icon(Icons.remove)),
                              backgroundColor: Colors.black,
                              foregroundColor:Colors.redAccent,
                              onPressed:(){
                                setState(() {
                                  counter--;

                                });

                              }
                          ),
                        ],
                      ),
                    ],
                  ),


                ],
              ),
            ),
          ),
          Container(
            height: 200,
            width: 400,
            decoration: BoxDecoration(
                color: Colors.greenAccent,
                border: Border.all(
                  color: Colors.green,
                ),
                borderRadius: BorderRadius.all(Radius.circular(200))
            ),
            child: Column(
              children: [
                Text("Press the Button to calculate yout BMI",style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold,fontStyle: FontStyle.italic),),
                // Text("Your BMI is",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)),
                // Text(bmi.round().toString(),style: TextStyle(fontSize: 40),),
                FloatingActionButton(
                    child: Center(child: Icon(Icons.ads_click)),
                    backgroundColor: Colors.lightBlueAccent,
                    foregroundColor: Colors.black,

                    onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>SecondPage(bmi:bmi)));
                      // Navigator.pushNamed(context, '/Second');
                      setState(() {
                      });
                      bmi=(counter*10000)/(_currentValue*_currentValue);
                    }
                ),
              ],
            ),
          ),
        ],

      ),


    );
  }
}
