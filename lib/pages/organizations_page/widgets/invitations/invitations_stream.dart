import 'package:efficacy_user/controllers/services/invitation/invitation_controller.dart';
import 'package:efficacy_user/controllers/services/user/user_controller.dart';
import 'package:efficacy_user/models/invitation/invitaion_model.dart';
import 'package:efficacy_user/pages/organizations_page/widgets/invitations/invitations_item.dart';
import 'package:efficacy_user/widgets/snack_bar/error_snack_bar.dart';
import 'package:flutter/material.dart';

class InvitationsStream extends StatelessWidget {
  final double maxHeight;
  const InvitationsStream({super.key, required this.maxHeight});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: StreamBuilder<List<InvitationModel>>(
        stream: InvitationController.get(
          recipientID: UserController.currentUser?.id,
        ),
        initialData: const [],
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final invitations = snapshot.data;
              if (invitations!.isNotEmpty) {
                return SingleChildScrollView(
                  child: Column(
                    children: invitations.map((invitation) {
                      return InvitationItem(
                        senderID: invitation.senderID,
                        clubPositionID: invitation.clubPositionID,
                        invitation: invitation,
                      );
                    }).toList(),
                  ),
                );
              } else if (snapshot.hasError) {
                showErrorSnackBar(context, 'Error: ${snapshot.error}');
                throw Exception('Error: ${snapshot.error}');
              } else {
                return const Text("No invitations");
              }
            } else {
              // Found to run when no user is logged in
              showErrorSnackBar(context, "Please login");
              throw Exception("User not logged in");
            }
          } else {
            // Works for all connection state but the one encountered here is ConnectionState.waiting
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
