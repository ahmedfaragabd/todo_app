import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/features/tasks/widget/task_item_widget.dart';

import '../../settings_provider.dart';

class TaskView extends StatefulWidget {
  TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  DateTime focusTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    var vm = Provider.of<SettingsProvider>(context);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 60),
          child: Stack(
            alignment: Alignment(0, 4.3),
            clipBehavior: Clip.none,
            children: [
              Container(
                  width: mediaQuery.width,
                  height: mediaQuery.height * 0.2,
                  color: theme.primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                  child: Text(
                    "TODO List",
                    style: theme.textTheme.titleLarge,
                  )),
              EasyInfiniteDateTimeLine(
                  firstDate: DateTime(2023),
                  focusDate: focusTime,
                  lastDate: DateTime(2025),
                  showTimelineHeader: false,
                  dayProps: EasyDayProps(
                      inactiveDayStyle: DayStyle(
                          dayNumStyle: theme.textTheme.bodySmall,
                          dayStrStyle: theme.textTheme.bodyMedium,
                          monthStrStyle: theme.textTheme.bodySmall
                              ?.copyWith(color: theme.primaryColor),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      todayStyle: DayStyle(
                          decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      )),
                      activeDayStyle: DayStyle(
                          dayNumStyle: theme.textTheme.bodyLarge
                              ?.copyWith(color: theme.primaryColor),
                          dayStrStyle: theme.textTheme.bodyMedium
                              ?.copyWith(color: theme.primaryColor),
                          monthStrStyle: theme.textTheme.bodySmall
                              ?.copyWith(color: theme.primaryColor),
                          decoration: BoxDecoration(
                              color: vm.isDark()
                                  ? Color(0xFF141922)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: theme.primaryColor)))),
                  onDateChange: (selectedDate) {
                    setState(() {
                      focusTime = selectedDate;
                    });
                  })
            ],
          ),
        ),
        Expanded(
            child: ListView(
          padding: EdgeInsets.zero,
          children: [
            TaskItemWidget(),
            TaskItemWidget(),
            TaskItemWidget(),
            TaskItemWidget(),
            TaskItemWidget(),
          ],
        ))
      ],
    );
  }
}
