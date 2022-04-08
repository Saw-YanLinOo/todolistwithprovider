import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolistwithprovider/model/task.dart';
import 'package:todolistwithprovider/provider/task_provider.dart';
import 'package:todolistwithprovider/widget/add_task.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static const String route = '/home';
  @override
  Widget build(BuildContext context) {
    var task = Provider.of<TaskProvider>(context);

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          child: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => SingleChildScrollView(
                    child:Container(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: const AddTask(),
                    )
                )
            );
          }
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  onTap: ()async{
                    var dateTime = await showDatePicker(
                      context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now().subtract(const Duration(days: 50)),
                        lastDate: DateTime.now().add(const Duration(days: 50)));
                    //task.filterList(date: dateTime!);
                  },
                  child: const CircleAvatar(
                    child: Icon(
                      Icons.list,
                      size: 30.0,
                      color: Colors.lightBlueAccent,
                    ),
                    backgroundColor: Colors.white,
                    radius: 30.0,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${task.length} Tasks',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: ListView.builder(
                itemCount: task.length,
                itemBuilder: (context,index){
                  Task taskItem = task.taskList[index];
                  return ListTile(
                    onLongPress: (){
                      showDialog<void>(
                        context: context,
                        builder: (BuildContext dialogContext) {
                          return AlertDialog(
                            content: const Text(
                              'Are You Sure?',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Delete'),
                                onPressed: () {
                                  task.delete(taskItem);
                                  Navigator.pop(context);// Dismiss alert dialog
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    title: Text(
                        taskItem.title,
                      style: TextStyle(
                        decoration: taskItem.isDone ? TextDecoration.lineThrough: TextDecoration.none,
                      ),
                    ),
                    trailing: Checkbox(
                      activeColor: Colors.lightBlueAccent,
                      value: taskItem.isDone,
                      onChanged: (bool? value) {
                        task.updateIsDone(taskItem);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
