import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twix/view/message_page.dart';
import 'package:twix/view/notification_page.dart';
import 'package:twix/view/search_page.dart';

import 'home_page.dart';

final pageTypeProvider = StateProvider<PageType>((ref) => PageType.home);

enum PageType { home, search, notification, message }

class RootPage extends StatelessWidget {
  final List<Widget> _pageList = <Widget>[
    HomePage(),
    SearchPage(),
    NotificationPage(),
    MessagePage(),
  ];

  RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final pageType = ref.watch(pageTypeProvider.state);

      final tabItems = [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.mail),
          label: '',
        ),
      ];
      return Scaffold(
        body: _pageList[pageType.state.index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageType.state.index,
          onTap: (index) {
            pageType.state = PageType.values[index];
          },
          items: tabItems,
        ),
      );
    });
  }
}
