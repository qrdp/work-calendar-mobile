import 'package:it2g_calendar_mobile/shared/models/task.dart';

class SetTasksAction {
  final List<Task> payload;
  SetTasksAction(this.payload);
}

class SetLoadingCalendarAction {
  final bool payload;
  SetLoadingCalendarAction(this.payload);
}
