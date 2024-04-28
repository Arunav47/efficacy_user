import 'package:efficacy_user/controllers/services/club/club_controller.dart';
import 'package:efficacy_user/controllers/services/user/user_controller.dart';
import 'package:efficacy_user/dialogs/loading_overlay/loading_overlay.dart';
import 'package:efficacy_user/models/club/club_model.dart';
import 'package:efficacy_user/pages/homepage/widgets/subscription_page/widgets/clubs/club_stream.dart';
import 'package:flutter/material.dart';

class SubscriptionShowcase extends StatefulWidget {
  const SubscriptionShowcase({
    super.key, 
    required this.filterIndex,  
    required this.onToggle});
  final int filterIndex;
  final ValueChanged<ClubModel> onToggle;
  

  @override
  State<SubscriptionShowcase> createState() => _SubscriptionShowcaseState();
}

class _SubscriptionShowcaseState extends State<SubscriptionShowcase> {

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
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 10.0),
        child: RefreshIndicator(
          onRefresh: () async {
              setState(() {
                clubStream = ClubController.get(
                  instituteName: "NIT, Silchar",
                  forceGet: true,
                );
              });
            },
          child: ClubsStream(filterIndex: widget.filterIndex, onToggle: _toggleSubscription, clubStream: clubStream)),
    );
  }
}