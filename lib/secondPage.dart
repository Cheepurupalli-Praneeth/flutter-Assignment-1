import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class SecondPage extends StatefulWidget {
  SecondPage({required this.bmi});


  double bmi;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String text = "";
  @override
  Widget build(BuildContext context) {
    if (widget.bmi<18.5){
      text = "Underweight";
    }
    else if(widget.bmi>25){
      text="Overweight";
    }
    else{
      text="Healthy";
    }
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("Result"),
      ),
      body:Column(
      mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Center(

            child: Container(

      height: 500,
        width: 400,
        decoration: BoxDecoration(
            color: Colors.greenAccent,
            border: Border.all(
              color: Colors.yellow,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [


                  Text("Your BMI is ${widget.bmi.round()}",style: TextStyle(
                      fontSize: 50
                  ),
                  ),
                  Text("You are ${text} !!!",style: TextStyle(
                    fontSize:40,fontWeight: FontWeight.bold,color:Colors.black
                  ),),
                  Text("Rate this app",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  RatingBar.builder(

                    initialRating: 3,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  ElevatedButton(


                      child: Center(child: Text("Click here to Check Again",style: TextStyle(color:Colors.black,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 30),)),



                      onPressed: (){
                        Navigator.pop(context);
                        setState(() {
                        });
                      }
                  ),
                ],
              )

            ),
          )


        ],
      ),
    );
  }
}















