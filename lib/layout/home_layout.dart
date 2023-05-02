
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_app/shared/cubit/cubit.dart';
import 'package:my_app/shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

import '../modules/archive_tasks/archive_tasks_screen.dart';
import '../modules/done_tasks/done_tasks_screen.dart';
import '../modules/new_tasks/new_tasks_screen.dart';
import '../shared/components/constants.dart';

class HomeLayout extends StatelessWidget {
 
 // Avant state bloc
  // int currentIndex = 0;

  // List<Widget> screens = [
  //   NewTasksScreen(),
  //   DoneTasksScreen(),
  //   ArchiveTasksScreen()
  // ];

  // List<String> titles = ['New Tasks', 'Done Tasks', 'Archive Tasks'];

  Database? database;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _FormKey = GlobalKey<FormState>();
  bool isBottomSheetShown = false;
  IconData FabIcon = Icons.edit;
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();

  //   createDatabase();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
       create: (BuildContext context) =>  AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
         listener: (BuildContext context,  AppStates state)  {
         
        },
        builder: (BuildContext context,  AppStates state) {

          AppCubit cubit = AppCubit.get(context) as AppCubit;
          
          ;
        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text(
              //titles[currentIndex],
               cubit.titles[cubit.currentIndex],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // body: tasks.length == 0 ? Center(child: CircularProgressIndicator()) : screens[currentIndex],
          body: ConditionalBuilder(
            //condition: tasks.length > 0 , avaant bloc state
             condition:true ,
            builder: (context) => cubit.screens[cubit.currentIndex], //screens[currentIndex]  avaant bloc state
            fallback: (context) => Center(child: CircularProgressIndicator()),
          ),
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
          
                    // setState(() {
                    //   FabIcon = Icons.edit;
                    // });
                  });
                }
              } else {
                _scaffoldKey.currentState
                    ?.showBottomSheet(
                      (context) => Container(
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
                    )
                    .closed
                    .then((value) {
                  isBottomSheetShown = false;
          
                  // setState(() {
                  //   FabIcon = Icons.edit;
                  // });
                });
          
                isBottomSheetShown = true;
          
                // setState(() {
                //   FabIcon = Icons.add;
                // });
              }
          
              //insertToDatabse() ;
            },
            child: Icon(FabIcon),
          ),
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              //currentIndex: currentIndex, avant state bloc
              currentIndex: cubit.currentIndex,

              onTap: (index) {

                //avant state bloc
                // setState(() {
                //   currentIndex = index; 
                // });

                cubit.changeIndex(index);
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
      ),
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
      // get databases
      getDataFromDatabase(database).then((value) {
        tasks = value;
        print(tasks);
      });
      print('database opend');
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
              'INSERT INTO tasks (title,date,time status) VALUES ("$title","$date","$time","New")')
          .then((value) {
        print('$value insert seccssfly');
      }).catchError((error) {
        print('Error when inserting new record  ${error.toString()}');
      });

      return null;
    });

    /// getfromdatabase
  }

// getfromdatabase// getfromdatabaseG

  Future<List<Map>> getDataFromDatabase(database) async {
    return await database!.rawQuery('SELECT * FROM tasks');
  }
}