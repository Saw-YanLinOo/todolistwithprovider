import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerProvider extends ChangeNotifier{
  DateTime _dateTime = DateTime.now();

  DateTime get pickDate => _dateTime;

  String get stringPickDate => DateFormat('dd.MM.yyyy').format(_dateTime);

  setPickDate({required DateTime candidateDate}){
    _dateTime = candidateDate;
    notifyListeners();
  }

  String dateToString({required DateTime dateTime}){
    return DateFormat('dd.MM.yyyy').format(dateTime);
  }
}