part of '../user_controller.dart';

Future<void> _deleteImpl() async {
  DbCollection collection =
      Database.instance.collection(UserController._collectionName);

  if (UserController.currentUser == null) {
    throw Exception("Please Login to your account");
  }
  if ((await UserController.get(
    email: UserController.currentUser!.email,
    forceGet: true,
  ).first)
      .isEmpty) {
    throw Exception("Couldn't find user");
  } else {
    SelectorBuilder selectorBuilder = SelectorBuilder();
    selectorBuilder.eq(UserFields.app.name, appName);
    for (ClubModel club in UserController.clubs) {
      List<String> followers = club.followers;

      // Improve Later
      await ClubController.update(club.copyWith(followers: followers));
    }
    selectorBuilder.eq(
      UserFields.email.name,
      UserController.currentUser!.email,
    );
    await collection.deleteOne(selectorBuilder);

    await UserController.logOut();
  }
}
