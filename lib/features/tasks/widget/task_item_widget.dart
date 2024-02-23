import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/features/settings_provider.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var vm = Provider.of<SettingsProvider>(context);

    return Container(
      width: mediaQuery.width,
      height: 115,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: vm.isDark() ? Color(0xFF141922) : Colors.white,
        borderRadius: BorderRadius.circular(15.5),
      ),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 90,
            decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: BorderRadius.circular(10)),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "play basketball",
                style: theme.textTheme.bodyMedium
                    ?.copyWith(color: theme.primaryColor),
              ),
              SizedBox(
                width: 5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.alarm,
                    size: 20,
                    color: vm.isDark() ? Colors.white : Color(0xFF141922),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "10.30 Am",
                    style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          ),
          Spacer(),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.check_rounded,
                size: 30,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
