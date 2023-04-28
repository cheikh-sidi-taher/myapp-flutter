import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import '../modules/archive_tasks/archive_tasks_screen.dart';
import '../modules/done_tasks/done_tasks_screen.dart';
import '../modules/new_tasks/new_tasks_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;

  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchiveTasksScreen()
  ];

  List<String> titles = ['New Tasks', 'Done Tasks', 'Archive Tasks'];

  Database? database;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _FormKey = GlobalKey<FormState>();
  bool isBottomSheetShown = false;
  IconData FabIcon = Icons.edit;
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  @override
  void initState() {
    super.initState();

    createDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          titles[currentIndex],
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: screens[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (isBottomSheetShown) {
            if (_FormKey.currentState!.validate()) {
              insertToDatabse(
                      title: titleController.text,
                      time: timeController.text,
                      date: dateController.text)
                  .then((value) {
                Navigator.pop(context);
                isBottomSheetShown = false;

                setState(() {
                  FabIcon = Icons.edit;
                });
              });
            }
          } else {
            _scaffoldKey.currentState?.showBottomSheet((context) => Container(
                  color: Colors.grey[200],
                  padding: EdgeInsets.all(20.0),
                  child: Form(
                    key: _FormKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: titleController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'title must not be  emty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'title',
                              prefixIcon: Icon(
                                Icons.title,
                              ),
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          controller: timeController,
                          keyboardType: TextInputType.datetime,
                          onTap: () {
                            showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now())
                                .then((value) {
                              timeController.text =
                                  value!.format(context).toString();
                              //print(value.format(context));
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'time  must not be  emty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'tasks time',
                              prefixIcon: Icon(
                                Icons.watch_later,
                              ),
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          controller: dateController,
                          keyboardType: TextInputType.datetime,
                          onTap: () {
                            showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2023-06-27'))
                                .then((value) {
                              dateController.text =
                                  DateFormat.yMMMd().format(value!);
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'date must not be  emty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'tasks date',
                              prefixIcon: Icon(
                                Icons.calendar_today,
                              ),
                              border: OutlineInputBorder()),
                        ),
                      ],
                    ),
                  ),
                ),
                elevation: 20.0,
                ).closed.then((value){
                   isBottomSheetShown = false;

                setState(() {
                  FabIcon = Icons.edit;
                });
                })
                
                
                ;

            isBottomSheetShown = true;

            setState(() {
              FabIcon = Icons.add;
            });
          }

          //insertToDatabse() ;
        },
        child: Icon(FabIcon),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.menu,
                ),
                label: 'Tasks'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.check_circle_outline,
                ),
                label: 'Done'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.archive_outlined,
                ),
                label: 'Archive'),
          ]),
    );
  }

  // Create databases
  void createDatabase() async {
    var database = await openDatabase('todo.db', version: 1,
        onCreate: (database, version) {
      print('database created');
      database
          .execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY , title TEXT, date TEXT, time TEXT, status TEXT)')
          .then((value) {
        print('table created');
      }).catchError((error) {
        print('Error when creating table ${error.toString()}');
      });
    }, onOpen: (database) {
      print('databse opend');
    });
  }

  // insert databases
  Future insertToDatabse({
    required String title,
    required String time,
    required String date,
  }) async {
    await database!.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO tasks (title,date,time status) VALUES ("$title","$time","$date","New")')
          .then((value) {
        print('$value insert seccssfly');
      }).catchError((error) {
        print('Error when inserting new record  ${error.toString()}');
      });

      return null;
    });
  }
}
