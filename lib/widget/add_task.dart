import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:todolistwithprovider/model/task.dart';
import 'package:todolistwithprovider/provider/task_provider.dart';
import 'package:todolistwithprovider/widget/DatePicker.dart';

import '../theme/style.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  // DateTime time = DateTime.now();
  // String pDateIni = '';
  String newTaskTitle = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<DatePickerProvider>(context,listen: false).setPickDate(candidateDate: DateTime.now());

    //pDateIni = DateFormat("dd.MM.yyyy").format(time);
  }
  @override
  Widget build(BuildContext context) {
    var taskProvider = Provider.of<TaskProvider>(context);
    var dateProvider = Provider.of<DatePickerProvider>(context);

    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Date',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: SizedBox(
                                height: 350,
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Column(
                                  children: [
                                    SizedBox(
                                        height: 350,
                                        width: MediaQuery.of(context).size.width * 0.9,
                                        child: SfDateRangePicker(
                                          showActionButtons: true,
                                          selectionMode:
                                          DateRangePickerSelectionMode.single,
                                          enablePastDates: false,
                                          selectionColor: Styles.one,
                                          onSubmit: (value) {
                                            // time = value as DateTime;
                                            // var result = DateFormat("dd.MM.yyyy").format(time);
                                            // setState(() {
                                            //   pDateIni = result.toString();
                                            // });
                                            dateProvider.setPickDate(candidateDate: value as DateTime);
                                            Navigator.pop(context);
                                          },
                                          onCancel: () {
                                            Navigator.pop(context);
                                          },
                                        )),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Styles.one.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                         dateProvider.stringPickDate,
                         //  pDateIni,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            FlatButton(
              child: const Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.lightBlueAccent,
              onPressed: () {
                var id = Random().nextInt(1000).toString();
                var time = dateProvider.pickDate;

                var task = Task(id: id, title: newTaskTitle, description: newTaskTitle, time: time);
                
                taskProvider.addTask(task);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
