import 'package:drift_train/pages/base_page.dart';
import 'package:drift_train/pages/folder_page.dart';
import 'package:drift_train/pages/load_image.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final List<BottomNavigationBarItem> _items = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
    const BottomNavigationBarItem(icon: Icon(Icons.folder), label: "folder"),
    const BottomNavigationBarItem(icon: Icon(Icons.photo), label: "photo"),
  ];

  final List<Widget> _pages = [BasePage(), FolderPage(), const LoadImage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: _items,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
