import 'package:efficacy_user/config/config.dart';
import 'package:efficacy_user/models/event/event_model.dart';
import 'package:efficacy_user/pages/homepage/widgets/tab_navigation/popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeBar extends StatefulWidget implements PreferredSizeWidget {
  HomeBar({
    super.key,
    required this.drawerKey,
    required this.currentBottomIndex,
    required this.tabController,
  });
  final int currentBottomIndex;
  final GlobalKey? drawerKey;
  final TabController tabController;
  @override
  State<HomeBar> createState() => _HomeBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
}

class _HomeBarState extends State<HomeBar> {
  List<String> title = ["Explore", "Home", "Subscription"];
  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10.0),
      child: AppBar(
        title: Center(child: Text(title[widget.currentBottomIndex])),
        leading: Center(
          child: Image.asset(
            Assets.efficacyUserLogoImagePath,
            height: 40,
            width: 40,
          ),
        ),
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.transparent,
        bottom: (widget.currentBottomIndex != 2)?
        TabBar(
          controller: widget.tabController,
          tabs: [
            Tab(text: "Upcoming Events",),
            Tab(text: "Ongoing Events",),
            Tab(text: "Past Events",)
          ]
        ):TabBar(
          controller: widget.tabController,
          tabs: [
            Tab(text: "All Clubs",),
            Tab(text: "Subscribed",),
            Tab(text: "Unsubscribed",)
          ]
        ),
        // Removing the default back button
        // automaticallyImplyLeading: false,
        // Editing the back button (back button not responsive on all pages due to navigation)
        // leading: const BackButton(
        //     style:
        //         ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.transparent),)),
        actions: [
          IconButton(
            key: widget.drawerKey,
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
            icon: Icon(
              CupertinoIcons.profile_circled,
              size: MediaQuery.of(context).size.width * 0.07,
            ),
            color: Colors.white,
          ),
        ].separate(5),
      ),
    );
  }
}


// import 'package:efficacy_user/config/config.dart';
// import 'package:efficacy_user/models/event/event_model.dart';
// import 'package:efficacy_user/pages/homepage/widgets/tab_navigation/popup.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class HomeBar extends StatefulWidget implements PreferredSizeWidget {
//   HomeBar({
//     super.key,
//     required this.drawerKey,
//     required this.navigator,
//     required this.currentTabIndex,
//     required this.currentBottomIndex,
//     required this.filterKeyHomePage
//   });
//   final int currentTabIndex;
//   final int currentBottomIndex;
//   final Function(EventStatus) navigator;
//   final GlobalKey? drawerKey;
//   GlobalKey filterKeyHomePage = GlobalKey();

//   @override
//   State<HomeBar> createState() => _HomeBarState();

//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => const Size.fromHeight(70);
// }

// class _HomeBarState extends State<HomeBar> {
//   @override
//   Widget build(context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 25.0, right: 17.0),
//       child: AppBar(
//         title: const Center(child: Text("Homepage")),
//         leading: Center(
//           child: Image.asset(
//             Assets.efficacyUserLogoImagePath,
//             height: 40,
//             width: 40,
//           ),
//         ),
//         surfaceTintColor: Colors.white,
//         backgroundColor: Colors.transparent,
//         // Removing the default back button
//         // automaticallyImplyLeading: false,
//         // Editing the back button (back button not responsive on all pages due to navigation)
//         // leading: const BackButton(
//         //     style:
//         //         ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.transparent),)),
//         actions: [
//           if (widget.currentBottomIndex != 2)
//             PopUpButton(
//               key: widget.filterKeyHomePage,
//               onTap: widget.navigator,
//               currentTabIndex: widget.currentTabIndex,
//             ),
//           IconButton(
//             key: widget.drawerKey,
//             onPressed: () {
//               Scaffold.of(context).openEndDrawer();
//             },
//             icon: Icon(
//               CupertinoIcons.profile_circled,
//               size: MediaQuery.of(context).size.width * 0.07,
//             ),
//             color: Colors.white,
//           ),
//         ].separate(5),
//       ),
//     );
//   }
// }
