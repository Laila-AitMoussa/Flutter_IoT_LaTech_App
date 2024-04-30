// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_count/cubit/cubit.dart';
import 'package:test_count/cubit/states.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 35.0,
              ),
              Center(
                child: CircleAvatar(
                    radius: 45.0,
                    backgroundColor: Colors.green[900],
                    child: Icon(
                      Icons.person_outline_rounded,
                      size: 45.0,
                      color: Colors.white,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 70, 15, 15),
                child: TextFormField(
                  initialValue: cubit.threTemp.toString(),
                  onChanged: (value) {
                    cubit.tempChange(value);
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text(
                      'Temperature Threshold',
                      style: TextStyle(fontSize: 17.0, color: Colors.blue[900]),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 27, 94, 32),
                            width: 3)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 13, 71, 161),
                            width: 3)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  initialValue: cubit.threHum.toString(),
                  onChanged: (value) {
                    cubit.humChange(value);
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text(
                      'Humidity Threshold',
                      style: TextStyle(fontSize: 17.0, color: Colors.blue[900]),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 27, 94, 32),
                            width: 3.0)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 13, 71, 161),
                            width: 3.0)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  initialValue: cubit.threWat.toString(),
                  onChanged: (value) {
                    cubit.watChange(value);
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text(
                      'Water Level Threshold',
                      style: TextStyle(fontSize: 17.0, color: Colors.blue[900]),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 27, 94, 32),
                            width: 3.0)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 13, 71, 161),
                            width: 3.0)),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
