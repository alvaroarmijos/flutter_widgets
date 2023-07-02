import 'package:flutter/material.dart';
import 'package:lalo_dart_general_examples/features/tab_page_selector/widgets.dart';

class TabPageSelectorPage extends StatefulWidget {
  const TabPageSelectorPage({Key? key}) : super(key: key);

  @override
  TabPageSelectorPageState createState() => TabPageSelectorPageState();
}

class TabPageSelectorPageState extends State<TabPageSelectorPage>
    with SingleTickerProviderStateMixin {
  late final TabController _controller;
  final Map<String, Map<String, String>> _onboardingList = {
    "0": {
      "image": "assets/images/onboarding1.png",
      "description": "Let us do all the work for you so you don’t have to",
    },
    "1": {
      "image": "assets/images/onboarding2.png",
      "description": "Keep life organized and work moving—all in one place.",
    },
    "2": {
      "image": "assets/images/onboarding3.png",
      "description": "In short: it’s a more human way to work.",
    }
  };

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: _onboardingList.length, vsync: this);
  }

  void _incrementCounter(int index) {
    setState(() {
      _controller.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: _onboardingList.length,
                onPageChanged: _incrementCounter,
                itemBuilder: (context, index) => TabPageSelectorWidget(
                    data: _onboardingList[index.toString()]!),
              ),
            ),
            SafeArea(
              child: TabPageSelector(
                controller: _controller,
                selectedColor: Colors.black,
                indicatorSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
