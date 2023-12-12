import 'dart:async';
import 'dart:io';
import 'package:efficacy_user/config/config.dart';
import 'package:efficacy_user/controllers/controllers.dart';
import 'package:efficacy_user/pages/pages.dart';
import 'package:efficacy_user/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  //route
  static const String routeName = "/splashscreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Function to process all async functions
  Future<int> init() async {
    Stopwatch stopwatch = Stopwatch()..start();
    await dotenv.load();
    await Database.init();
    await LocalDatabase.init();
    await ForegroundService.init();
    await ForegroundService.startDataSync();
    await UserController.loginSilently().last;
    stopwatch.stop();
    return stopwatch.elapsed.inMilliseconds;
  }

  @override
  void initState() {
    super.initState();
    init().then((duration) {
      debugPrint("Successfully completed all async tasks");
      debugPrint("Time taken: $duration ms");
      if (UserController.currentUser == null) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(
                SignInPage.routeName, (Route<dynamic> route) => false)
            .then((value) => exit(0));
      } else {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(
                Homepage.routeName, (Route<dynamic> route) => false)
            .then((value) => exit(0));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //screen height and width
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    //size constants
    final double avatarRadius = width * 0.25;
    final double gap = height * 0.03;

    return Scaffold(
      body: SizedBox(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              radius: avatarRadius,
              child: Image.asset(Assets.efficacyUserLogoImagePath),
            ),
            Text(
              "Efficacy",
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ].separate(gap),
        ),
      ),
    );
  }
}
