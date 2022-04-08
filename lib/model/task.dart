class Task{
  final String id;
  final String title;
  final String description;
  final DateTime time;
  bool isDone;

  Task({required this.id,required this.title,required this.description,required this.time,this.isDone = true});

  void toggleDone(){
    isDone = !isDone;
  }
}