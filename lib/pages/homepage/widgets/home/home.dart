import 'package:efficacy_user/pages/homepage/widgets/events_showcase_page/events_showcase_page.dart';
import 'package:efficacy_user/pages/homepage/widgets/home_appbar/home_appbar.dart';
import 'package:efficacy_user/widgets/custom_drawer/custom_drawer.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const String routeName = "/home";
  Home({
    super.key,
  });
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  late TabController tabController;
  GlobalKey drawerKey = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeBar(drawerKey: drawerKey, currentBottomIndex: 1, tabController: tabController),
      endDrawer: CustomDrawer(
          pageContext: context,
        ),
      body: TabBarView(
        controller: tabController,
        children: [
          EventsShowcasePage(showSubscribedOnly: true, currentEventFilterTypeIndex: ValueNotifier(0)),
          EventsShowcasePage(showSubscribedOnly: true, currentEventFilterTypeIndex: ValueNotifier(1)),
          EventsShowcasePage(showSubscribedOnly: true, currentEventFilterTypeIndex: ValueNotifier(2)),
        ]
      )
    );
  }
}