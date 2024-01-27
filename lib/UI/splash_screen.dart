import 'package:bmi_calculator_updated/UI/bmi_calculator.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
//ANIMATINON CODE
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this)..forward();

    //need to dispose this
@override
void dispose() {
  _controller.dispose(); // Dispose of the AnimationController
  super.dispose();
}

  //


  //splash
 void switchToBmiCalculatorScreen() {
    Navigator.pushReplacement(   
        context, MaterialPageRoute(builder: (context) =>const  BmiCalculator()));
  }
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), switchToBmiCalculatorScreen);
    super.initState();
  }
  //

  @override
  Widget build(BuildContext context) {
final height = MediaQuery.sizeOf(context).height *1;
final width = MediaQuery.sizeOf(context).width *1;
    return Scaffold(
      backgroundColor:const Color(0xFFEAAF72),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            AnimatedBuilder(
              animation: _controller, 
              child: SizedBox(
                height: height*0.3,
                width: width*0.3,
                child: Center(
                  child: Image.asset('assets/logo.png',height: height*0.3,),
                ),
              ),
              builder: (BuildContext context, Widget? child){
                return Transform.rotate(
                  angle: _controller.value*2.0*math.pi,
                  child: child,);
              }),

     SizedBox(height: MediaQuery.of(context).size.height*0.04,),
Center(child: Text('BMI CACLCULATOR APP',style: Theme.of(context).textTheme.titleMedium)),
Center(child: Text('By Muzammil',style: Theme.of(context).textTheme.bodyMedium)),


          ],
        ),
      ),
    );
  }
}
