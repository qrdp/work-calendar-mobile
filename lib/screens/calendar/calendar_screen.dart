import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/shared/components/employee_calendar.dart';
import 'package:it2g_calendar_mobile/screens/calendar/employee_tasks_list.dart';
import 'package:it2g_calendar_mobile/shared/components/modal_overlay.dart';
import 'package:it2g_calendar_mobile/shared/models/task.dart';
import 'package:it2g_calendar_mobile/shared/models/user.dart';
import 'package:it2g_calendar_mobile/store/store_fetch_service.dart';

import 'employee_calendar_form.dart';

class CalendarScreen extends StatelessWidget {
  final Function setTasks;
  final List<Task> tasks;
  final User user;

  CalendarScreen(
      {Key? key,
      required this.tasks,
      required this.setTasks,
      required this.user})
      : super(key: key) {
    if (tasks.length == 0) {
      StoreFetchService.fetchTasks(user.mailNickname);
    }
  }

  void openCreateEventsForm(BuildContext context) {
    Navigator.of(context).push(ModalOverlay(
        title: "Создать событие",
        child: EmployeeCalendarForm(
          user: user,
        )));
  }

  @override
  Widget build(BuildContext context) {
    // fetchTasks();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CupertinoNavigationBar(
          middle: Text('Присутствие'),
          trailing: GestureDetector(
            onTap: () => openCreateEventsForm(context),
            child: Icon(Icons.add),
          ),
        ),
        body: ListView(
          children: [
            EmployeeCalendar(
              tasks: tasks,
            ),
            EmployeeTasksList()
          ],
        ));
  }
}
