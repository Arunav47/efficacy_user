import 'package:efficacy_user/config/config.dart';
import 'package:efficacy_user/controllers/controllers.dart';
import 'package:efficacy_user/models/invitation/invitaion_model.dart';
import 'package:efficacy_user/models/models.dart';
import 'package:flutter/material.dart';

class InvitationItem extends StatelessWidget {
  final String clubPositionID;
  final String senderID;
  final InvitationModel invitation;
  const InvitationItem({
    super.key,
    required this.clubPositionID,
    required this.senderID,
    required this.invitation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: const BoxDecoration(
          border: BorderDirectional(bottom: BorderSide(color: shadow))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilder<List<ClubPositionModel>>(
                stream:
                    ClubPositionController.get(clubPositionID: clubPositionID),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  ClubPositionModel? clubPosition;
                  if (snapshot.hasData &&
                      snapshot.data != null &&
                      snapshot.data.isNotEmpty) {
                    clubPosition = snapshot.data.first;
                  }
                  return StreamBuilder<List<ClubModel>>(
                    stream: clubPosition?.id != null
                        ? ClubController.get(id: clubPosition?.clubID)
                        : null,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      ClubModel? club;
                      if (snapshot.hasData &&
                          snapshot.data != null &&
                          snapshot.data.isNotEmpty) {
                        club = snapshot.data.first;
                      }
                      return Column(
                        children: [
                          Text(
                            club?.name ?? "Club",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            clubPosition?.position ?? "Position",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              StreamBuilder<List<UserModel>>(
                stream: UserController.get(id: senderID),
                builder: (BuildContext context,
                    AsyncSnapshot<List<UserModel>> snapshot) {
                  String senderName = "Sender";
                  if (snapshot.hasData &&
                      snapshot.data != null &&
                      snapshot.data!.isNotEmpty) {
                    senderName = snapshot.data!.first.name;
                  }
                  return Text(
                    senderName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  );
                },
              ),
            ],
          ),
          Row(
            children: [
              Tooltip(
                message: "Accept",
                child: IconButton(
                  onPressed: () async {
                    // Handle accept invitation
                    await InvitationController.acceptInvitation(invitation.id!);
                  },
                  icon: const Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
                ),
              ),
              Tooltip(
                message: "Reject",
                child: IconButton(
                  onPressed: () async {
                    // Handle reject invitation
                    // await  InvitationController.rejectInvitation(invitation);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
