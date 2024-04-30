// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_count/cubit/cubit.dart';
import 'package:test_count/cubit/states.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  
  @override
  Widget build(BuildContext context) {
    AppCubit cubit = BlocProvider.of<AppCubit>(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        //AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('LaTech App'),
            
            backgroundColor: Color.fromARGB(255, 4, 79, 7),
            toolbarHeight: 65.0,
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.index,
              onTap: (index) {
                cubit.changeCurrentScreen(index);
              },
              
              iconSize: 27.0,
              unselectedFontSize: 13.0,
              selectedFontSize: 14.5,
              type: BottomNavigationBarType.shifting,
              
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_sharp),
                    label: 'Home',
                    backgroundColor: Color.fromARGB(255, 4, 79, 7)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.stacked_bar_chart_outlined),
                    label: 'Graphs',
                    backgroundColor: Color.fromARGB(255, 4, 79, 7)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Settings',
                    backgroundColor: Color.fromARGB(255, 4, 79, 7)),
              ]),
          body: cubit.activeBody[cubit.index],
        
        );
      },
    );
  }
}
