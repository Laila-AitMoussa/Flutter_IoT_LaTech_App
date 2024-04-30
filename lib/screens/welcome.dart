// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_count/cubit/cubit.dart';
import 'package:test_count/cubit/states.dart';
import 'package:test_count/screens/home.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = BlocProvider.of<AppCubit>(context);
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          //AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/Frame6.jfif'),
                      fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 170.0,
                  ),
                  Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/logo51.png'),
                      radius: 110.0,
                      backgroundColor: Colors.white10              ),
                  ),
                  SizedBox(
                    height: 80.0,
                  ),
                  Text(
                    'Welcome to',
                    style: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.0,
                        color: Colors.green[900],
                        fontFamily: 'Raleway'),
                  ),
                  Text(
                    'LaTech',
                    style: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.0,
                        color: Colors.green[900],
                        fontFamily: 'Raleway'),
                  ),
                  SizedBox(
                    height: 80.0,
                  ),
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green[900],
                    ),
                    child: IconButton(
                        color: Colors.white,
                        iconSize: 43.0,
                        style: ButtonStyle(),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Home()));
                        },
                        icon: Icon(Icons.arrow_forward_ios_rounded)),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
