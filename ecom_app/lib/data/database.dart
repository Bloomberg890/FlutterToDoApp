import 'package:hive_flutter/hive_flutter.dart';

//hiii r u done?
//save pubspec file
//and run the app
//the app is launching automatically for me lol
// can u delete tasks? I'm not able to :(
//slidable delete? i am replying to my own texts

//thinking it was you 😂
//not even in chrome? s
//am i supposed to give some permission? dk, can u launch it again? ok
//nice i am not able to launch it :(
// not launched yet
//did u close it? yes, i shouldn't?
//i launched it again
//ok don't close it. shini:
//if you saw it later 😂 (windows+semicolon)
//idk. yes in chrome
// OK why is it taking so long to launch is it opened for u?👌
//hi , anything else to do? yup
//just saw your whatsapp message ok

class ToDoDataBase {
  List toDoList = [];

  //reference our box
  final _myBox = Hive.box('mybox');

  //run this method if this is the 1st time ever opening this app
  void createInitialData() {
    toDoList = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
    ];
  }

  //load the data from database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
