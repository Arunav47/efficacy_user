import 'package:efficacy_user/config/config.dart';
import 'package:efficacy_user/models/event/event_model.dart';
import 'package:flutter/material.dart';

import 'navigation_button_style.dart';

class TabView extends StatelessWidget {
  const TabView({
    super.key,
    required this.currentTabIndex,
    required this.navigator,
  });

  final int currentTabIndex;
  final Function(Status) navigator;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: Status.values
            .map((status) => NavButton(
                  message: status,
                  onTap: () => navigator(status),
                  currentTabIndex: currentTabIndex,
                ))
            .toList()
            .separate(12),
      ),
    );
  }
}
