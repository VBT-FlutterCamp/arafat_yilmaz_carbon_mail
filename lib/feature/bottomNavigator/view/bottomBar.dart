import 'package:flutter/material.dart';
import 'package:mail_ui/feature/homeScreen/view/homeview.dart';
import 'package:mail_ui/feature/welcomeScreen/view/welcome_view.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({Key? key}) : super(key: key);

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _aktifSayfaNo = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        pageSnapping: false,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (acilanSayfaNo) {
          setState(() {
            _aktifSayfaNo = acilanSayfaNo;
          });
        },
        controller: _pageController,
        children: const <Widget>[
          HomeView(),
          WelcomeScreen(),
          HomeView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _aktifSayfaNo,
        selectedItemColor: Theme.of(context).primaryColor,
        showSelectedLabels: false,
        unselectedItemColor: Colors.grey[600],
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.show_chart_rounded), label: ""),
        ],
        onTap: (secilenSayfaNo) {
          setState(() {
            _pageController.jumpToPage(secilenSayfaNo);
          });
        },
      ),
    );
  }
}
