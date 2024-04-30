// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_count/cubit/states.dart';
import 'package:test_count/screens/home.dart';
import 'package:test_count/screens/graphs.dart';
import 'package:test_count/screens/settings.dart';
import 'package:test_count/screens/value.dart';
import 'package:http/http.dart' as http;

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);
  bool _isActive = true;
  bool ledOn = true;
  int counter = 0;
  int humidity = 10;
  double temperature = 10;
  int water = 10;
  int index = 0;
  double threTemp = 0.0;
  int threHum = 0;
  int threWat = 0;
  final dataBase = FirebaseDatabase.instance.ref().child('ESP');
  List<Widget> activeBody = [ValueScreen(), GraphsScreen(), SettingsScreen()];
  void changeCurrentScreen(int screen) {
    index = screen;
    emit(NavBarChanged());
  }

  void closeCubit() {
    _isActive = false;
  }

  void getData() {
    if (_isActive) {
      emit(DataGetting());
      dataBase.once().then((snap) {
        var value = snap.snapshot.value as Map<dynamic, dynamic>;
        humidity = value['Hum'];
        temperature = value['Tmp'].toDouble();
        water = value['Wat'];
        threTemp = value['ThreTemp'].toDouble();
        threHum = value['ThreHum'];
        threWat = value['ThreWat'];
        ledOn = value['Led'] == 1;
        emit(DataGot());
      }).then((value) {
        getJson();
      });
      dataBase.onChildChanged.listen((event) {
        DataSnapshot snap = event.snapshot;

        if (snap.key == 'Hum') {
          humidity = snap.value as int;
        }
        if (snap.key == 'Tmp') {
          if (snap.value is int) {
            temperature = (snap.value as int).toDouble();
          } else {
            temperature = snap.value as double;
          }
        }
        if (snap.key == 'Wat') {
          water = snap.value as int;
        }
        getJson();
        emit(DataGot());
      });
    }
  }

  void ledChange() {
    if (_isActive) {
      emit(LedPressed());
      ledOn = !ledOn;
      int ledInt = ledOn ? 1 : 0;
      dataBase.update({'Led': ledInt});
      emit(LedChanged());
    }
  }

  void tempChange(String val) {
    if (_isActive) {
      emit(TempOnChange());
      threTemp = double.tryParse(val) ?? 0.0;
      dataBase.update({'ThreTemp': threTemp});
      emit(TempChanged());
    }
  }

  void humChange(String val) {
    if (_isActive) {
      emit(HumOnChange());
      threHum = int.tryParse(val) ?? 0;
      dataBase.update({'ThreHum': threHum});
      emit(HumChanged());
    }
  }

  void watChange(String val) {
    if (_isActive) {
      emit(WatOnChange());
      threWat = int.tryParse(val) ?? 0;
      dataBase.update({'ThreWat': threWat});
      emit(WatChanged());
    }
  }

  late List<dynamic> values;
  int itemCount = 6;
  List<double> temp = [];
  List<double> hum = [];
  List<double> wat = [];
  List<String> time = [];

  Future getJson() async {
    if (_isActive) {
      emit(JsonGet());
      var url = Uri.https('script.google.com',
          'macros/s/AKfycbz1M26WjWGeKNJRHhUh_ht-2iH6oKgmczsHCNQjP-NmbHQnNOft0ky0PFRRaetcBcuaiA/exec');
      var json = await http.get(url);
      values = jsonDecode(json.body);
      itemCount = values.length < 6 ? values.length : 6;
      var dataUsed = values.sublist(0, itemCount);
      temp = [];
      hum = [];
      wat = [];
      time = [];
      for (var element in dataUsed) {
        temp.add((element['Temperarure'].toDouble() / 100));
        hum.add((element['Humidity'] / 100));
        wat.add((element['Water Level'] / 100));
        time.add((element['Date'].split('T')[1].substring(0, 5).toString()));
      }
      print(values);
      print(temp);
      print(hum);
      print(wat);
      print(time);
      emit(JsonGot());
    }
  }
}
