import 'package:flutter/material.dart';

class TabBarViewPage extends StatefulWidget {
  const TabBarViewPage({super.key});

  @override
  State<TabBarViewPage> createState() => _TabBarViewPageState();
}

class _TabBarViewPageState extends State<TabBarViewPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          body: Column(
        children: [
          SafeArea(
            bottom: false,
            child: Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: TabBar(
                  onTap: (value) => setState(
                        () {
                          _currentIndex = value;
                        },
                      ),
                  indicatorColor: Colors.transparent,
                  dividerHeight: 0,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  splashBorderRadius: BorderRadius.circular(20),
                  splashFactory: NoSplash.splashFactory,
                  enableFeedback: false,
                  labelPadding: EdgeInsets.zero,
                  tabs: [
                    TabBarIndicator(
                      'Home',
                      selected: _currentIndex == 0,
                    ),
                    TabBarIndicator(
                      'Chats',
                      selected: _currentIndex == 1,
                    ),
                    TabBarIndicator(
                      'Calls',
                      selected: _currentIndex == 2,
                    ),
                    TabBarIndicator(
                      'Settings',
                      selected: _currentIndex == 3,
                    ),
                  ]),
            ),
          ),
          Expanded(
            child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.blue,
                  ),
                  Container(
                    color: Colors.green,
                  ),
                  Container(
                    color: Colors.purple,
                  ),
                ]),
          ),
        ],
      )),
    );
  }
}

class TabBarIndicator extends StatelessWidget {
  const TabBarIndicator(
    this.text, {
    super.key,
    required this.selected,
  });

  final String text;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: ShapeDecoration(
        color: selected ? Colors.black : Colors.transparent,
        shape: const StadiumBorder(),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
