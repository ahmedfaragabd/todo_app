import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/features/settings_provider.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  static const String routeName = "layoutView";

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingsProvider>(context);

    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 32,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 12,
        elevation: 0,
        child: BottomNavigationBar(
          currentIndex: vm.currentIndex,
          onTap: vm.changeIndex,
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "Tasks"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined), label: "Settings"),
          ],
        ),
      ),
      body: vm.screens[vm.currentIndex],
    );
  }
}
