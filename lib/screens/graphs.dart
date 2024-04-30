// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_count/cubit/cubit.dart';
import 'package:test_count/cubit/states.dart';
import 'package:draw_graph/draw_graph.dart';
class GraphsScreen extends StatelessWidget {
  const GraphsScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
    AppCubit cubit = BlocProvider.of<AppCubit>(context);
     
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/Frame6.jfif'),
                    fit: BoxFit.cover,
                    opacity: 0.7)),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
             Container(
              width: 370.0,
                        height: 160.0,
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          //color:Colors.green[400],
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 232, 8, 34),
                              Color.fromARGB(255, 4, 123, 220)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
               child: Column(
                 children: [
                   Padding(
                     padding: const EdgeInsets.fromLTRB(5.0, 18.0, 15.0, 0.0),
                     child: LineGraph(
                             features: [
                      Feature(

                        data: List.from(cubit.temp.reversed),
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                             ],
                             //descriptionHeight: 5.0,
                             //showDescription: true,
                             size: Size((cubit.temp.length*70).toDouble(), 550),
                             labelX: List.from(cubit.time.reversed),
                             labelY: ['10°C', '20°C', '30°C', '40°C', '50°C','60°C','70°C','80°C'],
                             graphColor: Colors.white,
                           ),
                   ),
                   Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       Text('Temperature',
                       style: TextStyle(color: Colors.white,
                       fontSize: 22.0,
                       fontWeight: FontWeight.bold,
                       fontFamily: 'Mulish'),
                       ),
                       SizedBox(width:75.0),
                       Icon(Icons.chevron_right_rounded,
                       size: 40.0,
                       color: Colors.white,),
                     ],
                   ),
                 ],
               ),
             ),
             Container(
              width: 370.0,
                        height: 160.0,
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          //color:Colors.green[400],
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 5, 183, 32),
                              Color.fromARGB(255, 181, 181, 5)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
               child: Column(
                 children: [
                   Padding(
                     padding: const EdgeInsets.fromLTRB(5.0, 18.0, 15.0, 0.0),
                     child: LineGraph(
                             features: [
                      Feature(
                        title: 'Water Level',
                        data: cubit.hum.reversed.toList(),
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                             ],
                             //descriptionHeight: 5.0,
                             //showDescription: true,
                             size: Size((cubit.hum.length*70).toDouble(), 550),
                             labelX: List.from(cubit.time.reversed),
                             labelY: ['10%', '20%', '30%', '40%', '50%','60%','70%','80%','90%','100%'],
                             graphColor: Colors.white,
                           ),
                   ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                      Icon(Icons.chevron_left_rounded,
                       size: 40.0,
                       color: Colors.white,),
                       Text('Humidity',
                       style: TextStyle(color: Colors.white,
                       fontSize: 22.0,
                       fontWeight: FontWeight.bold,
                       fontFamily: 'Mulish'),
                       ),
                       Icon(Icons.chevron_right_rounded,
                       size: 40.0,
                       color: Colors.white,),
                     ],
                   ),
                 ],
               ),
             ),
             Container(
              width: 370.0,
                        height: 160.0,
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          //color:Colors.green[400],
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 8, 83, 232),
                              Color.fromARGB(255, 101, 108, 115)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
               child: Column(
                 children: [
                   Padding(
                     padding: const EdgeInsets.fromLTRB(5.0, 18.0, 15.0, 0.0),
                     child: LineGraph(
                             features: [
                      Feature(
                        title: 'Water Level',
                        data: cubit.wat.reversed.toList(),
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                             ],
                             //descriptionHeight: 5.0,
                             //showDescription: true,
                             size: Size((cubit.wat.length*70).toDouble(), 550),
                             labelX: List.from(cubit.time.reversed),
                             labelY: ['10%', '20%', '30%', '40%', '50%','60%','70%','80%','90%','100%'],
                             graphColor: Colors.white,
                           ),
                   ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                      Icon(Icons.chevron_left_rounded,
                       size: 40.0,
                       color: Colors.white,),
                       SizedBox(width:75.0),
                       Text('Water Level',
                       style: TextStyle(color: Colors.white,
                       fontSize: 22.0,
                       fontWeight: FontWeight.bold,
                       fontFamily: 'Mulish'),
                       ),
                     ],
                   ),
                 ],
               ),
             ),
            ],
           
          ),
        );
      },
    );
  }
}
List<Feature> features = [
  Feature(
    title: "Drink Water",
    color: Colors.blue,
    data: [0.2, 0.8, 1, 0.7, 0.6],
  ),
];