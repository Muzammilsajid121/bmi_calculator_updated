import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _MainScreenState();
}

class _MainScreenState extends State<BmiCalculator> {
  
  var weightController = TextEditingController();
  var feetController = TextEditingController();
  var inchController = TextEditingController();
  var result = '';
  var showImage = ""; 

  //
  void resetFunction() {
    result = "";
    showImage = "";
    weightController.clear(); 
    feetController.clear(); 
    inchController.clear();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height *1;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 196, 122),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEAAF72),
        title: Text(
          "BMI CALCULATOR",
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Colors.black),
        ),
        centerTitle: true,
      ),
      //

      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             const  SizedBox(
                height: 10,
              ),
              // Text(
              //   "Your's BMI",
              //   style: Theme.of(context).textTheme.titleMedium,
              // ),
              Image.asset('assets/chk1.png',height: height*0.11,),
              //
              const SizedBox(
                height: 15,
              ),
      
              //
              TextField(
                controller: weightController,
                decoration: InputDecoration(
                    label: Text(
                      "Enter Your Weight in KGs",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    prefixIcon: const Icon(Icons.line_weight),
                    border: const OutlineInputBorder()),
                //
                keyboardType:
                    TextInputType.number, // to open the number keyboard
              ),
              //
              const SizedBox(
                height: 13,
              ),
              //
              TextField(
                controller: feetController,
                decoration: InputDecoration(
                    label: Text(
                      "Enter Your Height in feet",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    prefixIcon: const  Icon(Icons.height),
                    border:const  OutlineInputBorder()),
                //
                keyboardType:
                    TextInputType.number, // to open the number keyboard
              ),
      
              const SizedBox(
                height: 13,
              ),
              //
      
              TextField(
                controller: inchController,
                decoration: InputDecoration(
                    label: Text(
                      "Enter Your Height in Inches",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    border: const OutlineInputBorder(),
                    prefixIcon:const  Icon(Icons.height)),
                //
                keyboardType: TextInputType.number,
              ),
              //
              const SizedBox(
                height: 13,
              ),
      
              //
      
              SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      var weight = weightController.text;
                      var feet = feetController.text;
                      var inch = inchController.text;
      
                      if (weight != "" && feet != "" && inch != "") {
                        // bmi calcultion()
      
                        // converting values to integer
                        var intWeight = int.parse(weight);
                        var intFeet = int.parse(feet);
                        var intInch = int.parse(inch);
      
                        /* We are taking user height in feet and inches just to improve UX otherwise it is required in meter 
                and now we have to convert these values. Now doing these calculations*/
      
                        var totalInch = (intFeet * 12) + intInch;
      
                        var totalCm = totalInch * 2.54;
      
                        var totalM = totalCm / 100;
      
                        var bmi = intWeight / (totalM * totalM);
      
                        //
                        var msg = '';
      
                        if (bmi > 25) {
                          msg = "You are over weight!!";
                          showImage = "assets/overf.png";
                        }
                        //
                        else if (bmi < 18) {
                          msg = "You are under weight!!";
                          showImage = "assets/underf.png";
                        }
                        //
                        else {
                          msg = "You are healthy";
                          showImage = "assets/heart.png";
                        }
      
                        // updating result to show BMI
                        setState(() {
                          result =
                              "$msg \n Your bmi is ${bmi.toStringAsFixed(2)}";
                          //.toStringAsFixed help us to limit decimal value
                        });
      
                        //
                      } else {
                        setState(() {
                          result = "Please fill all required feilds";
      
                          // if any text feild will be empty this text will be shown
                        });
                      }
                      //
                    },
                   
                    style: ElevatedButton.styleFrom(
                        backgroundColor:const  Color((0xFFEAAF72))),
      
                         child:  Text(
                      "Calculate",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.white),
                    ),
                        
                        
                        ),
              ),
             const  SizedBox(
                height: 12,
              ),
      
              //Reset Button
              SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      resetFunction();
                    },
          
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const  Color((0xFFEAAF72))),
      
                          child: Text(
                      "Reset",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.white),
                    ),
                        
                        ),
              ),
      
              //
      
              const SizedBox(
                height: 10,
              ),
      
              //
              Text(result, style: Theme.of(context).textTheme.bodyMedium),
      
              if (showImage
                  .isNotEmpty) // show the image only when showImage is not empty.
                Image.asset(
                  showImage,
                  height: 100,
                  width: double.infinity,
                )
            ],
          ),
        ),
      ),
      
    );
  }
}