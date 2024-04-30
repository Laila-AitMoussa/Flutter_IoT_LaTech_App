// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:test_count/cubit/cubit.dart';
import 'package:test_count/cubit/states.dart';

class ValueScreen extends StatelessWidget {
  ValueScreen({super.key});
  double prevValTemp = 0.0;
  int prevValHum = 0;
  int prevValWat = 0;
  void alertDialog(BuildContext context, String text) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        backgroundColor: Color.fromARGB(205, 255, 255, 255),
            title: Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: Text(
                'Warning',
                style: TextStyle(
                  fontFamily: 'Mulish',
                    fontSize: 25.0,
                    color: const Color.fromARGB(255, 215, 152, 5),
                    fontWeight: FontWeight.bold),
              ),
            ),
           
            content: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
              child: Text(
                text,
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey[700],fontFamily: 'Mulish'),
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK',style: TextStyle(color: Colors.green[900],fontSize: 18.0,fontWeight: FontWeight.bold),),
                
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = BlocProvider.of<AppCubit>(context);
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          // AppCubit cubit = AppCubit.get(context);
          if (state is DataGetting) {
            return Scaffold(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                body: Center(
                  child: SpinKitFadingCircle(
                    color: Colors.green[900],
                    size: 70.0,
                  ),
                ));
          } else {
            if (cubit.temperature >= cubit.threTemp &&
                cubit.temperature != prevValTemp) {
              //tempAlertShown = true;
              prevValTemp = cubit.temperature;
                if (cubit.temperature == cubit.threTemp){
                  alertDialog(context,
                  'The Temperature has reached the set Threshold of ${cubit.threTemp}°C');
              }
                  else{
                    alertDialog(context,
                  'The Temperature has exceeded the set Threshold of ${cubit.threTemp}°C');
                  }
            }
            if (cubit.humidity <= cubit.threHum &&
                cubit.humidity != prevValHum) {
              prevValHum = cubit.humidity;
              if (cubit.humidity == cubit.threHum){
                  alertDialog(context,
                  'The Humidity has reached the set Threshold of ${cubit.threHum}%');
              }
                  else{
                    alertDialog(context,
                  'The Humidity Level is currently below the set Threshold of ${cubit.threHum}%');
                  }
            }
            if (cubit.water <= cubit.threWat && cubit.water != prevValWat) {
              prevValWat = cubit.water;
              if (cubit.water == cubit.threWat){
                  alertDialog(context,
                  'The Water Level has reached the set Threshold of ${cubit.threWat}%');
              }
                  else{
                    alertDialog(context,
                  'The Water Level is currently below the set Threshold of ${cubit.threWat}%');
                  }
            }
            return Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/Frame6.jfif'),
                        fit: BoxFit.cover,
                        opacity: 0.7)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 360.0,
                      height: 200.0,
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        //color:Colors.brown[400],
                        image: DecorationImage(
                          image: AssetImage('assets/agro1.jfif'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 170.0,
                          height: 170.0,
                          margin: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            //color:Colors.green[400],
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 242, 187, 193),
                                Color.fromARGB(255, 187, 220, 247)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    10.0, 13.0, 0.0, 17.0),
                                child: Image(
                                  image: AssetImage(
                                    'assets/celsius.png',
                                  ),
                                  width: 50.0,
                                ),
                              ),
                              //SizedBox(height: 15.0,),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  'Temperature',
                                  style: TextStyle(
                                      fontSize: 23.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red[800],
                                      fontFamily: 'Mulish'),
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text(
                                  '${cubit.temperature}°C',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 3.0,
                                      color: Colors.red[700],
                                      fontFamily: 'Mulish'),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 170.0,
                          height: 170.0,
                          margin: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(30.0),
                            // color:  Colors.red[400],
                            gradient: LinearGradient(
                              colors: [
                                const Color.fromARGB(255, 178, 248, 181),
                                const Color.fromARGB(255, 249, 210, 153)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    10.0, 10.0, 0.0, 17.0),
                                child: Image(
                                  image: AssetImage(
                                    'assets/humidity.png',
                                  ),
                                  width: 53.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  'Humidity',
                                  style: TextStyle(
                                      fontSize: 23.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green[800],
                                      fontFamily: 'Mulish'),
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text(
                                  '${cubit.humidity}%',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 3.0,
                                      color: Colors.green[700],
                                      fontFamily: 'Mulish'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 170.0,
                          height: 170.0,
                          margin: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            //color: Colors.yellow[400],
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 130, 190, 235),
                                Color.fromARGB(255, 184, 181, 181)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    10.0, 16.0, 0.0, 17.0),
                                child: Image(
                                  image: AssetImage(
                                    'assets/water-level.png',
                                  ),
                                  width: 47.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  'Water Level',
                                  style: TextStyle(
                                      fontSize: 23.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue[800],
                                      fontFamily: 'Mulish'),
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text(
                                  '${cubit.water}%',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 3.0,
                                      color: Colors.blue[700],
                                      fontFamily: 'Mulish'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 170.0,
                          height: 170.0,
                          margin: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            //color: Colors.blue[400],
                            gradient: LinearGradient(
                              colors: [
                                const Color.fromARGB(255, 188, 188, 188),
                                const Color.fromARGB(255, 247, 205, 143)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    5.0, 8.0, 0.0, 8.0),
                                child: Image(
                                  image: AssetImage(
                                    'assets/led1.png',
                                  ),
                                  //width: 48.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  'Light',
                                  style: TextStyle(
                                      fontSize: 23.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange[800],
                                      fontFamily: 'Mulish'),
                                ),
                              ),
                              SizedBox(
                                height: 3.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      cubit.ledOn ? 'On' : 'Off',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 3.0,
                                          color: cubit.ledOn
                                              ? Colors.orange[700]
                                              : Colors.grey[700],
                                          fontFamily: 'Mulish'),
                                    ),
                                    Switch(
                                      value: cubit.ledOn,
                                      onChanged: (value) => cubit.ledChange(),
                                      activeColor: Colors.orange[700],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ));
          }
        });
  }
}
