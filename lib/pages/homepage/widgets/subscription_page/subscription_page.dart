import 'package:efficacy_user/config/config.dart';
import 'package:efficacy_user/controllers/controllers.dart';
import 'package:efficacy_user/dialogs/loading_overlay/loading_overlay.dart';
import 'package:efficacy_user/models/club/club_model.dart';
import 'package:efficacy_user/pages/homepage/widgets/home_appbar/home_appbar.dart';
import 'package:efficacy_user/pages/homepage/widgets/subscription_page/widgets/clubs/club_stream.dart';
import 'package:efficacy_user/pages/homepage/widgets/subscription_page/widgets/filter_button.dart';
import 'package:efficacy_user/pages/homepage/widgets/subscription_page/widgets/subscription_showcase.dart';
import 'package:efficacy_user/widgets/custom_drawer/custom_drawer.dart';
import 'package:flutter/material.dart';

import '../../../../utils/local_database/local_database.dart';
import '../../../../utils/tutorials/tutorials.dart';

class SubscriptionPage extends StatefulWidget {
  SubscriptionPage({
    super.key,
  });

  @override
  State<SubscriptionPage> createState() => SubscriptionPageState();
}

class SubscriptionPageState extends State<SubscriptionPage> with SingleTickerProviderStateMixin{
  GlobalKey filterKeySubPage = GlobalKey();
  GlobalKey drawerKey = GlobalKey();
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
    if (LocalDatabase.getAndSetGuideStatus(LocalGuideCheck.subFilter)) {
      TutorialStatus.isGuideRunningNotifier.value = true;
      Future.delayed(const Duration(seconds: 0), () {
        showSubFilterTutorial(
          context,
          filterKeySubPage,
          onFinish: () {
            setState(() {
              TutorialStatus.isGuideRunningNotifier.value = false;
            });
          },
          onSkip: () {
            setState(() {
              TutorialStatus.isGuideRunningNotifier.value = false;
            });
            // Returning true to allow skip
            return true;
          },
        );
      });
    }
  }
  
  int filterIndex = 0;

  late Stream<List<ClubModel>> clubStream =
      ClubController.get(instituteName: "NIT, Silchar");

  void _toggleSubscription(ClubModel club) async {
    showLoadingOverlay(
      context: context,
      asyncTask: () async {
        await UserController.toggleFollowClub(clubID: club.id!);
      },
      onCompleted: () => setState(() {}),
    );
  }

  void _changeIndex(int index) {
    setState(() {
      filterIndex = index;
    });
  }
  void _changeTabIndex(TabController tabController){
    setState(() {
      filterIndex = tabController.index;
    });
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: HomeBar(drawerKey: drawerKey, currentBottomIndex: 2, tabController: tabController),
      endDrawer: CustomDrawer(
          pageContext: context,
        ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 10.0),
        child: TabBarView(
          controller: tabController,
          
          children: [
            SubscriptionShowcase(filterIndex: 0, onToggle: _toggleSubscription,),
            SubscriptionShowcase(filterIndex: 1, onToggle: _toggleSubscription,),
            SubscriptionShowcase(filterIndex: 2, onToggle: _toggleSubscription,)
            // RefreshIndicator(
            //   onRefresh: () async {
            //     setState(() {
            //       clubStream = ClubController.get(
            //         instituteName: "NIT, Silchar",
            //         forceGet: true,
            //       );
            //     });
            //   },
            //   // child: Column(
            //   //   children: [
            //       // Align(
            //       //   alignment: Alignment.centerLeft,
            //       //   child: Padding(
            //       //     padding: const EdgeInsets.only(bottom: 30),
            //       //     child: Text(
            //       //       "Subscriptions",
            //       //       style: TextStyle(
            //       //         fontSize: width * 0.08,
            //       //         color: const Color.fromARGB(253, 82, 81, 81),
            //       //       ),
            //       //     ),
            //       //   ),
            //       // ),
            //       // Row(
            //       //   children: [
            //       //     Text(
            //       //       "Filters",
            //       //       style: TextStyle(
            //       //         fontSize: width * 0.06,
            //       //         color: const Color.fromARGB(253, 82, 81, 81),
            //       //         fontWeight: FontWeight.w500,
            //       //       ),
            //       //     ),
            //       //     FilterButton(
            //       //       key: filterKeySubPage,
            //       //       onTap: _changeIndex,
            //       //       currentTabIndex: filterIndex,
            //       //     ),
            //       //   ].separate(10),
            //       // ),
            //       // ClubsStream(
            //       //   onToggle: _toggleSubscription,
            //       //   filterIndex: widget.tabController.index,
            //       //   clubStream: clubStream,
            //       // ),
            
            //   //   ],
            //   // ),
            // ),
      
          ],
        ),
      ),
    );
  }
}
